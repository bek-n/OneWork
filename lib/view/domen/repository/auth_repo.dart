import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../interface/auth_facade.dart';
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
  Future<TokenModel?> verifyEmail(
      {required String email, required String code}) async {
    try {
      var res = await dio.client().post(
        "/auth/verify",
        data: {
          "email": email,
          "code": code,
        },
      );
      return TokenModel.fromJson(res.data);
    } catch (e) {
      debugPrint("Verify Error : $e");
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
  Future<Response?> login(
      {required String email, required String password}) async {
    try {
      var res = await dio.client().post(
        "/auth/login",
        data: {"email": email, "password": password, "user_type": "applicant"},
      );
      return res;
    } catch (e) {
      debugPrint("Login Error : $e");
      return null;
    }
  }

  @override
  Future<ProfileModel?> getUser() async {
    try {
      final token = await LocalStore.getAccessToken();
      var res = await dio.client(token: token).get(
            "/api/profile",
          );
      return ProfileModel.fromJson(res.data);
    } catch (e) {
      debugPrint("Get Profile Error : $e");
      return null;
    }
  }

  @override
  Future<TokenModel?> refreshToken() async {
    try {
      final refreshToken = await LocalStore.getRefreshToken();
      var res = await dio.client().post(
        " token/refresh",
        data: {
          "refresh_token": refreshToken,
        },
      );
      return TokenModel.fromJson(res.data);
    } catch (e) {
      debugPrint("Get Profile Error : $e");
      return null;
    }
  }

  @override
  Future getApplication() async {
    try {
      final token = await LocalStore.getAccessToken();
      var res = await dio.client(token: token).get(
        "/applications",
        queryParameters: {
          'id': 0
        }
      );
      return ProfileModel.fromJson(res.data);
    } catch (e) {
      debugPrint("Get Profile Error : $e");
      return null;
    }
  }
}