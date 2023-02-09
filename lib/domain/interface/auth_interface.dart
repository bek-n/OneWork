import 'package:dio/dio.dart';
import 'package:one_work/domain/model/profile_model.dart';

import '../model/token_model.dart';

abstract class AuthFacade {
  Future<Response?> signUp({required String email, required String password});

  Future<Response?> login({required String email, required String password});

  Future<TokenModel?> verifyEmail({required String email, required String code});

  Future logout();

  Future<TokenModel?> refreshToken();

  Future<ProfileModel?> getUser();

  Future getApplication();
}