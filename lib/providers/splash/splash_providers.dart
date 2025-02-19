import 'package:flutter/cupertino.dart';
import 'package:free_talk/views/routes.dart';

import '../../services/helper/cache_helper.dart';

class SplashProviders extends ChangeNotifier{
  bool isOpened = CacheHelper.getData(key: 'opened') ?? false;
  String token = CacheHelper.getData(key: 'token') ?? '';

  void navigateAfterDelay(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      if(token.isEmpty){
        isOpened? Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.login,(route) => false,):
        Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.onboarding,(route) => false,);
      }else{
        Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.home,(route) => false,);
      }
    });
  }
}