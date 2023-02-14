import 'package:dio/dio.dart';

class DioService {
  Dio client({String? token}) {
    return Dio(BaseOptions(
      baseUrl: "https://onework.uz",
      headers: {
        if (token != null) "Authorization": "Bearer $token",
      },
    ))
      ..interceptors.add(LogInterceptor(
          responseBody: true,
          requestBody: true,
          requestHeader: true,
          responseHeader: false));
  }
}
