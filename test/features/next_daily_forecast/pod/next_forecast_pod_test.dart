import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:riverpod_test/riverpod_test.dart';
import 'package:weather_app/const/app_urls.dart';
import 'package:weather_app/data/model/nextforecast_model.dart';
import 'package:weather_app/data/repository/weather/weather_repo_pod.dart';
import 'package:weather_app/data/repository/weather/weather_repository.dart';
import 'package:weather_app/features/next_daily_forecast/controller/next_forecaster_pod.dart';
import 'package:weather_app/features/next_daily_forecast/state/next_forecast_state.dart';
import 'package:weather_app/shared/api_client/dio/default_api_interceptor.dart';

import 'package:weather_app/shared/pods/location/notifier/location_service_stream_pod.dart';

import '../../../mock_geolocator.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final dio = Dio(
    BaseOptions(
      baseUrl: AppUrls.baseURL,
    ),
  );
  dio.interceptors.addAll([
    //TalkerDioLogger(),
    DefaultAPIInterceptor(dio: dio),
  ]);
  final dioAdapter = DioAdapter(dio: dio);
  const apikey = "api";
  late final WeatherRepository weatherRepo =
      WeatherRepository(dio: dio, apiKey: apikey);

  setUp(() {
    GeolocatorPlatform.instance = MockGeolocatorPlatform();
  });

  group("NextForecastNotifier", () {
    testAsyncNotifier(
      "shoud be loading",
      overrides: [
        locationEnableStreamPod
            .overrideWith((ref) => Stream.value(ServiceStatus.enabled)),
        weatherRepoPod.overrideWithValue(weatherRepo),
      ],
      provider: nextForeCastPod,
      expect: () => [
        isA<AsyncData>().having(
            (s) => s.value, "is GettingLocation", isA<GettingForeCastData>()),
      ],
    );
    testAsyncNotifier(
      "shoud be Forecast data as success",
      overrides: [
        weatherRepoPod.overrideWithValue(weatherRepo),
      ],
      setUp: () async {
        dioAdapter.onGet(
          AppUrls.nextForecast,
          (server) => server.reply(
            200,
            NextForeCastModel(
              cod: "cod",
              message: 200,
              cnt: 5,
              list: [],
              city: City(
                id: 1,
                name: "name",
                coord: Coord(lat: 22.00, lon: 84.0),
                country: "India",
                population: 2000,
                timezone: 5,
                sunrise: 6,
                sunset: 7,
              ),
            ).toMap(),
            // Reply would wait for one-sec before returning data.
            delay: const Duration(seconds: 1),
          ),
        );
      },
      provider: nextForeCastPod,
      act: (notifier) => notifier.getWeatherForeCast(),
      expect: () => [
        isA<AsyncData>().having(
          (s) => s.value,
          "state is GettingLocation",
          isA<GettingLocation>(),
        ),
        isA<AsyncData>().having(
          (s) => s.value,
          "state is GettingForeCastData",
          isA<GettingForeCastData>(),
        ),
        isA<AsyncData>().having(
          (s) => s.value,
          "state is GettingForeCastData",
          isA<GettingForeCastData>(),
        ),
        isA<AsyncData>().having(
          (s) => s.value,
          "state is ForeCastData",
          isA<ForeCastData>(),
        ),
        isA<AsyncData>().having(
          (s) => s.value,
          "state is GettingLocation",
          isA<ForeCastData>().having(
              (s) => s.nextForeCastModel,
              "same forecast",
              equals(NextForeCastModel(
                cod: "cod",
                message: 200,
                cnt: 5,
                list: [],
                city: City(
                  id: 1,
                  name: "name",
                  coord: Coord(lat: 22.00, lon: 84.0),
                  country: "India",
                  population: 2000,
                  timezone: 5,
                  sunrise: 6,
                  sunset: 7,
                ),
              ))),
        ),
      ],
    );
  });
}
