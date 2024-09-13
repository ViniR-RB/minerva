import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:minerva/app/core/enviroments/enviroments.dart';
import 'package:minerva/app/core/rest_client/interceptors/auth_interceptor.dart';

class RestClient extends DioForNative {
  RestClient()
      : super(
          BaseOptions(
            baseUrl: Enviroment.apiUrl,
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 60),
          ),
        ) {
    interceptors.addAll([
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
      AuthInterceptor()
    ]);
  }
  RestClient get auth {
    options.extra["DIO_AUTH_KEY"] = true;
    return this;
  }

  RestClient get unauth {
    options.extra["DIO_AUTH_KEY"] = false;
    return this;
  }
}
