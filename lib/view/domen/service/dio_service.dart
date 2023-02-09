import 'package:dio/dio.dart';
import '../interface/auth_facade.dart';
import '../repository/auth_repo.dart';
import 'local_store.dart';

class DioService {
  final AuthFacade auth = AuthRepo();

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
          responseHeader: false))
      ..interceptors.add(InterceptorsWrapper(onError: (error, event) async {
        if (error.response?.statusCode == 401) {
          var res = await auth.refreshToken();
          LocalStore.setAccessToken(res!.token);
          event.resolve(error.response!);
        }
      }));
  }
}
