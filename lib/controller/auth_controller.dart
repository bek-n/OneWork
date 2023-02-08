import 'package:flutter/cupertino.dart';

import '../view/domen/repository/auth_repo.dart';
import '../view/domen/service/local_store.dart';

class AuthController extends ChangeNotifier {
  String? wrongPassword;
  bool isLoading = false;

  signUp({
    required String email,
    required String password,
    required String confirmPassword,
    required VoidCallback onSuccess,
  }) async {
    if (password == confirmPassword) {
      isLoading = true;
      notifyListeners();
      final AuthRepo authRepo = AuthRepo();
      var res = await authRepo.signUp(email: email, password: password);
      if (res?.statusCode == 200) {
         isLoading = false;
      notifyListeners();
        onSuccess();
      }
    } else {
      wrongPassword = "Error Password";
      notifyListeners();
    }
  }

  verifyEmail(
      {required String code,
      required String email,
      required VoidCallback onSuccess}) async {
    final AuthRepo authRepo = AuthRepo();
    var res = await authRepo.verifyEmail(email: email, code: code);
    if (res != null) {
      await LocalStore.setAccessToken(res.token);
      onSuccess();
    }
  }
}
