import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:one_work/domain/model/token_model.dart';
import 'package:one_work/domain/service/dio_sevice.dart';

class AuthRepo {
  DioService dio = DioService();

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
}