import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:weather_app/bootstrap.dart';
import 'package:weather_app/features/next_daily_forecast/controller/next_forecaster_pod.dart';
import 'package:weather_app/features/next_daily_forecast/state/next_forecast_state.dart';

@RoutePage(
  deferredLoading: true,
)
class MapDataPage extends ConsumerStatefulWidget {
  const MapDataPage({Key? key}) : super(key: key);

  @override
  ConsumerState<MapDataPage> createState() => _MapDataPageState();
}

class _MapDataPageState extends ConsumerState<MapDataPage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  Set<Marker> markers = {};

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(20.84, 85.15),
    zoom: 14.4746,
  );

  Future<void> gotoLocation() async {
    final position = await Geolocator.getCurrentPosition();

    final mapcontroller = await _controller.future;
    mapcontroller.animateCamera(
        CameraUpdate.newLatLng(LatLng(position.latitude, position.longitude)));
  }

  void addWeatherMarker() async {
    final nextforecaststate = await ref.read(nextForeCastPod.future);
    if (nextforecaststate is ForeCastData) {
      final nextforecastmodel = nextforecaststate.nextForeCastModel;
      final weatherinfo = nextforecastmodel.list.first;
      final marker = Marker(
        markerId: MarkerId(
            '${nextforecastmodel.city.coord.lat}-${nextforecastmodel.city.coord.lon}'),
        position: LatLng(
            nextforecastmodel.city.coord.lat, nextforecastmodel.city.coord.lon),
        infoWindow: InfoWindow(
          title: 'Temperature: ${weatherinfo.main.temp}°C',
          snippet: 'Precipitation: ${(weatherinfo.rain?.the3H ?? 00) * 100} mm',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      );

      markers.add(marker);
    }
    talker.log("markers ${markers.length}");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        markers: markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          gotoLocation();
          addWeatherMarker();
        },
      ).safeArea(),
    );
  }
}
