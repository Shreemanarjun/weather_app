import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/data/repository/weather/weather_repo_pod.dart';
import 'package:weather_app/features/next_daily_forecast/state/next_forecast_state.dart';
import 'package:weather_app/shared/pods/location/pod/location_acess_pod.dart';
import 'package:weather_app/shared/riverpod_ext/cancel_extensions.dart';

class NextForeCastNotifier extends AutoDisposeAsyncNotifier<NextForeCastState> {
  @override
  FutureOr<NextForeCastState> build() {
    getWeatherForeCast();
    return future;
  }

  void getWeatherForeCast() async {
    state = const AsyncData(GettingLocation());
    final locationEnabled =
        await ref.watch(locationAccessPod.notifier).getLocation(
      onError: (error) {
        state = AsyncData(LocationError(error: error));
      },
    );
    if (locationEnabled) {
      final position = await Geolocator.getCurrentPosition();
      state = AsyncData(GettingForeCastData());
      final result = await ref.watch(weatherRepoPod).fetchWeatherData(
            longitude: position.longitude.toString(),
            latitude: position.latitude.toString(),
            cancelToken: ref.cancelToken(),
          );
      result.when((nextforecastmodel) {
        state = AsyncData(ForeCastData(nextForeCastModel: nextforecastmodel));
      }, (error) {
        state = AsyncData(ForeCastError(error: error.errorMessage));
      });
    }
  }
}
