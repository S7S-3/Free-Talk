import 'package:flutter/material.dart';

class RegisterProviders extends ChangeNotifier{
  int currentPage= 1;
  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void nextPage(){
    currentPage=2;
    notifyListeners();
  }

}