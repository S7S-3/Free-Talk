import 'package:flutter/material.dart';
import 'package:free_talk/models/register/registermodel.dart';
import 'package:free_talk/services/helper/dio_helper.dart';
import 'package:free_talk/utils/constants/constants.dart';

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
      register = RegisterModel(
        userName: userNameController.text,
        email: emailController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
      );
      await DioHelper.postData(
        url: Constants.register,
        data: register.toJson(),
      ).then(
        (value) {
          register = RegisterModel.fromJson(value.data);
        },
      );
      loading = false;
      message = 'has been created';
      showCustomSnackBar(context,message);
      Navigator.pop(context);
    } catch (e) {
      registerSuccess = false;
      message = 'User is already existed';
      showCustomSnackBar(context,message);
      notifyListeners();
    } finally {
      loading = false;
    }
  }
}
