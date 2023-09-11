import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/data/repository/weather/i_weather_repository.dart';
import 'package:weather_app/data/repository/weather/weather_repository.dart';
import 'package:weather_app/shared/api_client/dio/dio_client_provider.dart';
import 'package:weather_app/shared/pods/api_key_pod.dart';

final weatherRepoPod = Provider.autoDispose<IWeatherRepository>((ref) {
  return WeatherRepository(
    dio: ref.watch(dioProvider),
    apiKey: ref.watch(apiKeyPod),
  );
});
