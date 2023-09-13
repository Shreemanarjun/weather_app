import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:weather_app/const/app_urls.dart';
import 'package:weather_app/data/model/nextforecast_model.dart';
import 'package:weather_app/shared/exception/base_exception.dart';

import 'i_weather_repository.dart';

class WeatherRepository implements IWeatherRepository {
  final Dio dio;
  final String apiKey;

  WeatherRepository({required this.dio, required this.apiKey});

  @override
  Future<Result<NextForeCastModel, APIException>> fetchWeatherData({
    required String latitude,
    required String longitude,
    required CancelToken cancelToken,
  }) async {
    final result = await dio.get(AppUrls.nextForecast,
        queryParameters: {
          "lat": latitude,
          "lon": longitude,
          "units": "metric",
          "appid": apiKey,
        },
        cancelToken: cancelToken);
    if (result.statusCode == 200) {
      return Success(NextForeCastModel.fromMap(result.data));
    } else {
      return Error(APIException.fromMap(result.data));
    }
  }
}
