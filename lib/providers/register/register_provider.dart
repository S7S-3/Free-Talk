import 'package:flutter/material.dart';

class RegisterProviders extends ChangeNotifier {
  int currentPage = 1;
  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isLogoVisible = true;
  final formKey = GlobalKey<FormState>();
  void nextPage() {
    currentPage = 2;
    notifyListeners();
  }

  void previousPage() {
    currentPage = 1;
    notifyListeners();
  }

  void navToLogin(BuildContext context) {
    Navigator.pop(context);
  }

  void isDisappear(BuildContext context) {
    isLogoVisible = !isLogoVisible;
    notifyListeners();
  }
}
