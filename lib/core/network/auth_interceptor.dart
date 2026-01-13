import 'package:dio/dio.dart';

import '../utils/hive/hive_utils.dart';

class AuthInterceptor extends Interceptor {
@override
void onRequest(
  RequestOptions options,
  RequestInterceptorHandler handler,
){
  final token = HiveUtils.getToken();

  if(token != null){
    options.headers["Authorization"] = "Bearer $token";
  }
  handler.next(options);
}
}

// ✔ Dio ne connaît PAS Hive
// ✔ L’interceptor oui (et c’est normal)