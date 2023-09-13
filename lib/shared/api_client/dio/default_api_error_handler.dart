import 'package:dio/dio.dart';

// coverage:ignore-file
///This error handler used in interceptor for resolving response for specific
///dio exception type to generalize the mesages whic can easy to understand for the end user.
Future<void> defaultAPIErrorHandler(
  DioException err,
  ErrorInterceptorHandler handler,
  Dio dio,
) async {
  switch (err.type) {
    case DioExceptionType.connectionTimeout:
      handler.resolve(
        Response(
          data: {'errorMessage': 'connect timeout error'},
          requestOptions: err.requestOptions,
        ),
      );
    case DioExceptionType.sendTimeout:
      handler.resolve(
        Response(
          data: {'errorMessage': 'sending data is slow'},
          requestOptions: err.requestOptions,
        ),
      );
    case DioExceptionType.receiveTimeout:
      handler.resolve(
        Response(
          data: {'errorMessage': 'receiving data is slow'},
          requestOptions: err.requestOptions,
        ),
      );
    case DioExceptionType.badResponse:
      if (err.response!.statusCode == 404) {
        handler.resolve(
          Response(
            data: {
              'errorMessage':
                  'server error: status code ${err.response!.statusCode}'
            },
            requestOptions: RequestOptions(path: err.requestOptions.path),
          ),
        );
      } else {
        handler.resolve(
          Response(
            data: {'errorMessage': err.response?.data['message'] ?? "error"},
            requestOptions: err.requestOptions,
          ),
        );
      }
    case DioExceptionType.cancel:
      handler.resolve(
        Response(
          data: {'errorMessage': 'user cancelled request'},
          requestOptions: err.requestOptions,
        ),
      );
    case DioExceptionType.badCertificate:
      handler.resolve(
        Response(
          data: {'errorMessage': 'Bad certificate'},
          requestOptions: err.requestOptions,
        ),
      );
    case DioExceptionType.connectionError:
      handler.resolve(
        Response(
          data: {'errorMessage': 'No Internet'},
          requestOptions: err.requestOptions,
        ),
      );
    case DioExceptionType.unknown:
      handler.resolve(
        Response(
          data: {'errorMessage': 'other error data:${err.response?.data}'},
          requestOptions: err.requestOptions,
        ),
      );
  }
}
