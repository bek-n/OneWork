import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import '../domen/interface/auth_facade.dart';
import '../domen/model/edit_user_model.dart';
import '../domen/model/login_model.dart';
import '../domen/model/profile_model.dart';
import '../domen/repository/auth_repo.dart';
import '../domen/service/local_store.dart';

class AuthController extends ChangeNotifier {
  String? wrongPassword;
  bool isLoading = false;
  bool isVisibility = true;
  String email = '';
  final AuthFacade authRepo = AuthRepo();
  ProfileModel? profile = ProfileModel();
  int currentIndex = 0;
  String fcmtoken2 = '';
  String? imageUrl;
   XFile? image;
   final ImagePicker picker = ImagePicker();

  setIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  signUp({
    required String email,
    required String password,
    required String confirmPassword,
    required VoidCallback onSuccess,
  }) async {
    isLoading = true;
    notifyListeners();
    if (password == confirmPassword) {
      var res = await authRepo.signUp(email: email, password: password);
      email = email;
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
      required String fcmtoken,
      required VoidCallback onSuccess}) async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    FirebaseMessaging.onBackgroundMessage((RemoteMessage message) async {
      print("onBackgroundMessage");
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("onMessageOpenedApp");
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("onMessage");
    });

    final fcmtoken1 = await FirebaseMessaging.instance.getToken();
    fcmtoken = '$fcmtoken1';
    fcmtoken2 = fcmtoken;
    print('fcm : $fcmtoken');
    isLoading = true;
    notifyListeners();

    var res = await authRepo.verifyEmail(
        email: email, code: code, fcmToken: fcmtoken);
    if (res != null) {
      await LocalStore.setAccessToken(res.token);
      isLoading = false;
      notifyListeners();
      onSuccess();
    }
  }

  login({
    required String email,
    required String password,
    required VoidCallback onSuccess,
  }) async {
    var res = await authRepo.login(
        email: email, password: password, fcmToken: fcmtoken2);
    if (res?.statusCode == 200) {
      var login = LoginModel.fromJson(res?.data);
      LocalStore.setAccessToken(login.accessToken ?? "");
      LocalStore.setRefreshToken(login.refreshToken ?? "");
      onSuccess();
    }
  }

  logOut() {
    authRepo.logout();
    LocalStore.clearAll();
  }

  getUser(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    profile = await authRepo.getUser(context);
    isLoading = false;
    notifyListeners();
  }

  editUser(BuildContext context, EditUserModel newUser) async {
    isLoading = true;
    notifyListeners();
    profile = await authRepo.editUser(context, newUser);
    isLoading = false;
    notifyListeners();
  }

  createUser(BuildContext context, EditUserModel newUser) async {
    isLoading = true;
    notifyListeners();
    profile = await authRepo.createUser(context, newUser);
    isLoading = false;
    notifyListeners();
  }

  onChange() {
    isVisibility = !isVisibility;
    notifyListeners();
  }

  getApplication(BuildContext context, int userId) async {
    isLoading = true;
    notifyListeners();
    await authRepo.getApplication(context, userId);
    isLoading = false;
    notifyListeners();
  }

  getUploading(BuildContext context, String imagePath) async {
    isLoading = true;
    notifyListeners();
    imageUrl = await authRepo.uploadImage(context, imagePath);
    isLoading = false;
    notifyListeners();
  }
}
