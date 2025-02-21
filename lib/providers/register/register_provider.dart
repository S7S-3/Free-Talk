import 'package:flutter/material.dart';
import 'package:free_talk/models/register/registermodel.dart';
import 'package:free_talk/models/user/user_model.dart';
import 'package:free_talk/services/firebase/auth_service.dart';
import 'package:free_talk/services/firebase/user_service.dart';
import 'package:free_talk/services/helper/dio_helper.dart';
import 'package:free_talk/utils/constants/constants.dart';

import '../../models/login/loginmodel.dart';
import '../../utils/widgets/custom_snackbar.dart';

class RegisterProviders extends ChangeNotifier {
  int currentPage = 1;
  final emailController = TextEditingController();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final String passwordPattern =
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';
  final String emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  bool isPasswordVisible = true;
  bool isConfirmPasswordVisible = true;
  bool loading = false;
  bool registerSuccess = false;
  String message = '';
  RegisterModel register = RegisterModel();
  UserModel user = UserModel(
    profile: '',
    name: '',
    email: ''
  );
  LoginModel login = LoginModel(
    email: '',
    password: ''
  );

  final formKey = GlobalKey<FormState>();
  void nextPage() {
    currentPage = 2;
    notifyListeners();
  }

  void passwordVisible() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  void confirmPasswordVisible() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    notifyListeners();
  }

  void previousPage() {
    currentPage = 1;
    notifyListeners();
  }

  void registerAccount(BuildContext context) async {
    loading = true;
    notifyListeners();
    try {
      login.email = emailController.text;
      login.password = passwordController.text;
      user = UserModel(
        profile: '0',
        name: userNameController.text,
        email: emailController.text
      );
      var uid = await AuthService().register(login);
        await UserService().setData(user, uid);
      Navigator.pop(context);
    } catch (e) {
      showCustomSnackBar(context, e.runtimeType.toString());
    } finally {
      loading = false;
    }
  }
}
