import 'package:flutter/material.dart';
import 'package:free_talk/providers/login/login_provider.dart';
import 'package:free_talk/services/helper/cache_helper.dart';
import 'package:free_talk/views/login/login_views.dart';
import 'package:free_talk/views/onboarding/onboarding_views.dart';
import 'package:provider/provider.dart';
import 'package:free_talk/providers/onboarding/onboarding_provider.dart';
import 'package:free_talk/views/routes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  bool isOpened = CacheHelper.getData(key: 'opened') ?? false;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OnboardingProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
      ],
      child: MyApp(isOpened: isOpened,),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key,required this.isOpened});
  final bool isOpened;

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home:  isOpened? const LoginScreen():const OnboardingScreen(),
      onGenerateRoute: AppRoutes.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
