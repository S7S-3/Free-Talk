import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:free_talk/providers/login/login_provider.dart';
import 'package:free_talk/providers/splash/splash_providers.dart';
import 'package:free_talk/services/helper/cache_helper.dart';
import 'package:free_talk/views/slpash/splash_views.dart';
import 'package:provider/provider.dart';
import 'package:free_talk/providers/onboarding/onboarding_provider.dart';
import 'package:free_talk/views/routes.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CacheHelper.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OnboardingProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => SplashProviders()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      home: SplashScreen(),
      onGenerateRoute: AppRoutes.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
