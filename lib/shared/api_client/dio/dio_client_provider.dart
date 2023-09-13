import 'package:dio/dio.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/bootstrap.dart';
import 'package:weather_app/const/app_urls.dart';
import 'package:weather_app/shared/api_client/dio/bad_certificate_fixer.dart';
import 'package:weather_app/shared/api_client/dio/default_api_interceptor.dart';
import 'package:weather_app/shared/api_client/dio/default_time_response_interceptor.dart';
import 'package:weather_app/shared/api_client/dio/form_data_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

///This provider dioClient with interceptors(TimeResponseInterceptor,FormDataInterceptor,TalkerDioLogger,DefaultAPIInterceptor)
///with fixing bad certificate.
final dioProvider = Provider.autoDispose<Dio>(
  (ref) {
    final dio = Dio();
    dio.options.baseUrl = AppUrls.baseURL;
    if (kDebugMode) {
      dio.interceptors.add(TimeResponseInterceptor());
      dio.interceptors.add(FormDataInterceptor());
      dio.interceptors.add(
        TalkerDioLogger(
          talker: talker,
          settings: const TalkerDioLoggerSettings(
            printRequestHeaders: true,
            printResponseHeaders: true,
          ),
        ),
      );
    }
    dio.interceptors.add(DefaultAPIInterceptor(dio: dio));

    fixBadCertificate(dio: dio);
    return dio;
  },
  name: 'dioProvider',
);
