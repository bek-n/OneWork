import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:one_work/view/pages/auth/register_page.dart';
import '../interface/auth_facade.dart';
import '../model/application_model.dart';
import '../model/edit_user_model.dart';
import '../model/profile_model.dart';
import '../model/token_model.dart';
import '../service/dio_service.dart';
import '../service/local_store.dart';

class AuthRepo implements AuthFacade {
  DioService dio = DioService();

  @override
  Future<Response?> signUp(
      {required String email, required String password}) async {
    try {
      var res = await dio.client().post(
        "/auth/sign-up",
        data: {"email": email, "password": password, "user_type": "applicant"},
      );
      return res;
    } catch (e) {
      debugPrint("Sign Up Error : $e");
      return null;
    }
  }

  @override
  Future logout() async {
    try {
      final token = await LocalStore.getAccessToken();
      await dio.client(token: token).post(
            "/auth/logout",
          );
      return null;
    } catch (e) {
      debugPrint(":Log out Error : $e");
      return null;
    }
  }

  @override
  Future<getProfile?> getUser(BuildContext context) async {
    try {
      final token = await LocalStore.getAccessToken();
      var res = await dio.client(token: token).get(
            "/api/profile/applicant",
          );
      print("${res.data}");
      return getProfile.fromJson(res.data);
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        var res = await refreshToken(context);
        if (res != null) {
          // ignore: use_build_context_synchronously
          await getUser(context);
        }
      }
      print("error: $e");
    }
    return null;
  }

  @override
  Future<TokenModel?> refreshToken(BuildContext context) async {
    try {
      final refreshToken = await LocalStore.getRefreshToken();
      print("refreshToken: $refreshToken");
      var res = await dio.client().post(
        "/token/refresh",
        data: {
          "refresh_token": refreshToken,
        },
      );

      var tokenModel = TokenModel.fromJson(res.data);
      await LocalStore.setAccessToken(tokenModel.token);
      return tokenModel;
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        LocalStore.clearAll();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const RegisterPage()),
            (route) => false);
      }
      debugPrint("Get Profile Error : $e");
      return null;
    }
  }

  @override
  Future editUser(BuildContext context, EditUserModel newUser) async {
    try {
      final token = await LocalStore.getAccessToken();
      await dio
          .client(token: token)
          .put("/applicants/${newUser.id}", data: newUser.toJson());
      return null;
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        var res = await refreshToken(context);
        if (res != null) {
          // ignore: use_build_context_synchronously
          await editUser(context, newUser);
        }
      }
    }
    return null;
  }

  @override
  Future<ApplicationModel?> getApplication(
      BuildContext context, int userId) async {
    try {
      final token = await LocalStore.getAccessToken();
      var res = await dio.client(token: token).get(
            "/applicants/4",
          );
      return ApplicationModel.fromJson(res.data);
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        var res = await refreshToken(context);
        if (res != null) {
          // ignore: use_build_context_synchronously
          await getApplication(context, userId);
        }
      }
    }
    return null;
  }

  @override
  Future<TokenModel?> verifyEmail(
      {required String email,
      required String code,
      required String fcmToken}) async {
    try {
      var res = await dio.client().post(
        "/auth/verify",
        data: {"email": email, "code": code, "fcm_token": fcmToken},
      );
      return TokenModel.fromJson(res.data);
    } catch (e) {
      debugPrint("Verify Error : $e");
      return null;
    }
  }

  @override
  Future<Response?> login(
      {required String email,
      required String password,
      required String fcmToken}) async {
    try {
      var res = await dio.client().post(
        "/auth/login",
        data: {"email": email, "password": password, "fcm_token": fcmToken},
      );
      return res;
    } catch (e) {
      debugPrint("Login Error : $e");
      return null;
    }
  }

  @override
  Future createUser(BuildContext context, EditUserModel newUser) async {
    try {
      final token = await LocalStore.getAccessToken();
      await dio
          .client(token: token)
          .post("/applicants", data: newUser.toJson());
      return null;
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        var res = await refreshToken(context);
        if (res != null) {
          // ignore: use_build_context_synchronously
          await createUser(context, newUser);
        }
      }
    }
    return null;
  }

  @override
  Future uploadImage(BuildContext context, String imagePath) async {
    FormData formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(imagePath),
    });
    try {
      var res = await dio.client().post("/images", data: formData);
      print("res : ${res.data}");
      return res.data;
    } on DioError catch (e) {
      print("error : $e");
    }
    return null;
  }
}
