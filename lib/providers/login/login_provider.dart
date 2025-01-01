import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:free_talk/services/helper/dio_helper.dart';
import 'package:free_talk/utils/constants/constants.dart';
import 'package:free_talk/views/routes.dart';

import '../../models/login/loginmodel.dart';
import '../../services/helper/secure_cache_helper.dart';
import '../../utils/widgets/custom_snackbar.dart';

class LoginProvider extends ChangeNotifier {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordVisible = true;
  bool loading = false;
  bool loginSuccess = false;
  String message = '';
  LoginModel login=LoginModel();
  var cache;
  final formKey = GlobalKey<FormState>();

  void passwordVisible(){
    isPasswordVisible=!isPasswordVisible;
    notifyListeners();
  }

  void navToRegister(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.register);
  }
  void loginAccount(BuildContext context) async {
    loading = true;
    notifyListeners();
    try {
      login = LoginModel(
        password: passwordController.text,
        userName: userNameController.text,
      );
      final response = await DioHelper.postData(
        url: Constants.login,
        data: login.toJson(),
      );
      login = LoginModel.fromJson(response.data);
      await SecureCacheHelper.saveData(key: 'token', value: login.token);

      message = 'Login success';
      showCustomSnackBar(context, message);

      // Navigate to the home screen only on successful login
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.home,
            (route) => false,
      );
    } on DioException catch (e) {
      if (e.response != null && e.response!.statusCode == 400) {
        message = 'Invalid Credentials';
      } else {
        message = 'An error occurred: ${e.message}';
      }
      showCustomSnackBar(context, message);
    } catch (e) {
      message = 'An unexpected error occurred';
      showCustomSnackBar(context, message);
    } finally {
      loading = false;
      notifyListeners();
    }
  }


}
