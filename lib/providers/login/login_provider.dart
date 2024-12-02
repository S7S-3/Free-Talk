import 'package:flutter/material.dart';
import 'package:free_talk/views/routes.dart';

class LoginProvider extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordVisible = false;

  void login(String email,String password,BuildContext context){
    Navigator.pushNamedAndRemoveUntil(context, AppRoutes.home, (route) => false);

  }


}
