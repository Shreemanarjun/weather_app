import 'package:dio/io.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/shared/api_client/dio/default_time_response_interceptor.dart';
import 'package:weather_app/shared/api_client/dio/dio_client_provider.dart';
import 'package:weather_app/shared/api_client/dio/form_data_interceptor.dart';
import 'package:riverpod_test/riverpod_test.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

void main() {
  testProvider(
    'expect dio.baseUrl should be " http://api.openweathermap.org/data/2.5/',
    provider: dioProvider,
    expect: () => [
      isA<DioForNative>()
          .having(
            (d) => d.options.baseUrl,
            'default interceptor should be 2',
            equals("http://api.openweathermap.org/data/2.5/"),
          )
          .having(
            (d) => d.interceptors.length,
            "Interceptors should be 5",
            equals(4),
          )
          .having(
              (d) => d.interceptors,
              "Contains all response interceptor",
              containsAll(
                [
                  isA<TimeResponseInterceptor>(),
                  isA<FormDataInterceptor>(),
                  isA<TalkerDioLogger>(),
                ],
              )),
    ],
  );
}
