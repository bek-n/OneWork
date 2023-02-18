import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../model/application_model.dart';
import '../model/edit_user_model.dart';
import '../model/profile_model.dart';
import '../model/token_model.dart';

abstract class AuthFacade {
  Future<Response?> signUp({required String email, required String password});

  Future<Response?> login(
      {required String email,
      required String password,
      required String fcmToken});

  Future<TokenModel?> verifyEmail(
      {required String email, required String code, required String fcmToken});

  Future logout();

  Future<TokenModel?> refreshToken(BuildContext context);

  Future<getProfile?> getUser(BuildContext context);

  Future<ApplicationModel?> getApplication(BuildContext context, int userId);

  Future editUser(BuildContext context, EditUserModel newUser);

  Future createUser(BuildContext context, EditUserModel newUser);

  Future uploadImage(BuildContext context, String imagePath);
}
