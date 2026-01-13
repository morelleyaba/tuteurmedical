import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../constants/app_constants.dart';
import 'auth_interceptor.dart';

class ApiProvider {
  // Configuration globale de Dio (1 seule fois)
  final Dio dio ;

  ApiProvider() : dio = Dio(
    BaseOptions(
      baseUrl: AppConstants.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      headers: {
        "Content-Type": "application/json",
      },
    )){
            dio.interceptors.add(AuthInterceptor()
    );
    if (kDebugMode) {
      dio.interceptors.add(PrettyDioLogger(requestBody: true));
    }
    }
}
