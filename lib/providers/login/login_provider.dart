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
  void loginAccount(BuildContext context)async{
    loading =true;
    notifyListeners();
    try{
        login=LoginModel(password: passwordController.text,userName: userNameController.text);
        DioHelper.postData(url: Constants.login, data: login.toJson()).then((value) {
        login = LoginModel.fromJson(value.data);
        SecureCacheHelper.saveData(key: 'token', value: login.token);
      },);
        loading = false;
        message ='Login success';
        showCustomSnackBar(context,message);
       Navigator.pushNamedAndRemoveUntil(
           context, AppRoutes.home, (route) => false);
    }catch(e){
      message ='Invalid Credentials';
      showCustomSnackBar(context,message);
    }finally{
      loading =false;
      notifyListeners();
    }
  }

}
