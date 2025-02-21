import 'package:flutter/material.dart';
import 'package:free_talk/views/routes.dart';

import '../../models/login/loginmodel.dart';
import '../../services/firebase/auth_service.dart';
import '../../utils/widgets/custom_snackbar.dart';

class LoginProvider extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordVisible = true;
  bool loading = false;
  bool loginSuccess = false;
  String message = '';
  final formKey = GlobalKey<FormState>();

  void passwordVisible() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  void navToRegister(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.register);
  }

  void loginAccount(BuildContext context) async {
    loading = true;
    notifyListeners();
    try {
      var login = LoginModel(
        password: passwordController.text,
        email: emailController.text,
      );
      await AuthService().login(login);
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.home,
        (route) => false,
      );
    } catch (e) {
      message = 'An unexpected error occurred';
      showCustomSnackBar(context, message);
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}
