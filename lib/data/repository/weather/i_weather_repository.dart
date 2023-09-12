import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:weather_app/data/model/nextforecast_model.dart';
import 'package:weather_app/shared/exception/base_exception.dart';

abstract class IWeatherRepository {
  Future<Result<NextForeCastModel, APIException>> fetchWeatherData({
    required String latitude,
    required String longitude,
    required CancelToken cancelToken,
  });
}
