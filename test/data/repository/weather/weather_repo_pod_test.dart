import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:riverpod_test/riverpod_test.dart';
import 'package:weather_app/const/app_urls.dart';
import 'package:weather_app/data/model/nextforecast_model.dart';
import 'package:weather_app/data/repository/weather/i_weather_repository.dart';
import 'package:weather_app/data/repository/weather/weather_repo_pod.dart';
import 'package:weather_app/data/repository/weather/weather_repository.dart';
import 'package:weather_app/shared/api_client/dio/default_api_interceptor.dart';
import 'package:weather_app/shared/api_client/dio/dio_client_provider.dart';
import 'package:weather_app/shared/exception/base_exception.dart';

void main() {
  group("Weather Repository Test", () {
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
    late final CancelToken cancelToken = CancelToken();
    testProvider(
      "fetch weather data",
      provider: weatherRepoPod,
      overrides: [
        dioProvider.overrideWithValue(dio),
      ],
      expect: () => [isA<WeatherRepository>()],
    );

    testResultProvider<WeatherRepository>(
      "check success api call",
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
        //mockDioClient.options.baseUrl = AppUrls.baseURL;
      },
      overrides: [
        weatherRepoPod.overrideWithValue(weatherRepo),
      ],
      provider: weatherRepoPod,
      act: (repo) async => (await repo.fetchWeatherData(
          latitude: "20.84", longitude: "84.00", cancelToken: cancelToken)),
      expect: () => [
        isA<Success<NextForeCastModel, APIException>>()
            .having(
              (r) => r.isSuccess(),
              "is success",
              true,
            )
            .having(
                (r) => r.tryGetSuccess(),
                "check NextForecastModel",
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
                )),
      ],
    );
    testResultProvider<IWeatherRepository>(
      "check error api call",
      setUp: () {
        dioAdapter.onGet(
          AppUrls.nextForecast,
          (server) => server.reply(
            400,
            {"errorMessage": "Bad request"},
            // Reply would wait for one-sec before returning data.
            delay: const Duration(seconds: 1),
          ),
        );
      },
      overrides: [
        weatherRepoPod.overrideWithValue(weatherRepo),
      ],
      provider: weatherRepoPod,
      act: (repo) async => (await repo.fetchWeatherData(
          latitude: "20.84", longitude: "84.00", cancelToken: cancelToken)),
      expect: () => [
        isA<Error<NextForeCastModel, APIException>>()
            .having(
              (r) => r.isError(),
              "is Error",
              true,
            )
            .having((s) => s.tryGetError(), "check message",
                APIException(errorMessage: "Bad request"))
      ],
    );
  });
}
