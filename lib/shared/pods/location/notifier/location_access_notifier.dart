import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:platform_info/platform_info.dart';
import 'package:weather_app/shared/pods/location/notifier/location_service_stream_pod.dart';

class LocationAccessNotifier extends AutoDisposeAsyncNotifier<bool> {
  @override
  FutureOr<bool> build() async {
    ref.watch(locationEnableStreamPod);
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    final permissionEnabled =
        (await Geolocator.checkPermission()) == LocationPermission.whileInUse;
    return (serviceEnabled && permissionEnabled);
  }

  Future<void> checkLocationAccess({
    required void Function(String error) onError,
  }) async {
    state = await AsyncValue.guard(() async {
      final locationEnabled = await getLocation(onError: onError);
      return locationEnabled;
    });
  }

  Future<bool> getLocation(
      {required void Function(String error) onError}) async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      onError('Location services are disabled.');
      if (Platform.I.isMobile) {
        Geolocator.openLocationSettings();
      }
      return false;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        onError('Location permissions are denied');
        if (Platform.I.isMobile) {
          Geolocator.openAppSettings();
        }
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      onError(
          'Location permissions are permanently denied, we cannot request permissions.');
      if (Platform.I.isMobile) {
        Geolocator.openAppSettings();
      }
      return false;
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return true;
  }
}
