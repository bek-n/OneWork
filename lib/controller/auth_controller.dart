import 'package:flutter/cupertino.dart';
import 'package:one_work/domain/interface/auth_interface.dart';
import 'package:one_work/domain/model/login_model.dart';
import 'package:one_work/domain/model/profile_model.dart';
import 'package:one_work/domain/repository/auth_repo.dart';
import 'package:one_work/domain/service/local_store.dart';

class AuthController extends ChangeNotifier {
  final AuthFacade authRepo = AuthRepo();
  ProfileModel? profile = ProfileModel();
  String? wrongPassword;
  bool isLoading = true;

  signUp({
    required String email,
    required String password,
    required String confirmPassword,
    required VoidCallback onSuccess,
  }) async {
    if (password == confirmPassword) {
      var res = await authRepo.signUp(email: email, password: password);
      if (res?.statusCode == 200) {
        onSuccess();
      }
    } else {
      wrongPassword = "Error Password";
      notifyListeners();
    }
  }

  login({
    required String email,
    required String password,
    required VoidCallback onSuccess,
  }) async {
    var res = await authRepo.login(email: email, password: password);
    if (res?.statusCode == 200) {
      var login =  LoginModel.fromJson(res?.data);
      LocalStore.setAccessToken(login.accessToken ?? "");
      LocalStore.setRefreshToken(login.refreshToken ?? "");
      onSuccess();
    }
  }

  verifyEmail(
      {required String code,
      required String email,
      required VoidCallback onSuccess}) async {
    var res = await authRepo.verifyEmail(email: email, code: code);
    if (res != null) {
      await LocalStore.setAccessToken(res.token);
      await LocalStore.setRefreshToken(res.refreshToken!);
      onSuccess();
    }
  }

  logOut() {
    LocalStore.clearAll();
    authRepo.logout();
  }

  getUser() async {
    isLoading = true;
    notifyListeners();
    profile = await authRepo.getUser();
    isLoading = false;
    notifyListeners();
  }
}