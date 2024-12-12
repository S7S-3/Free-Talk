import 'package:flutter/material.dart';
import 'package:free_talk/providers/register/register_provider.dart';
import 'package:free_talk/providers/splash/splash_providers.dart';
import 'package:free_talk/views/register/register_views.dart';
import 'package:free_talk/views/slpash/splash_views.dart';
import 'package:provider/provider.dart';

import '../providers/home/home_provider.dart';
import '../providers/login/login_provider.dart';
import '../providers/onboarding/onboarding_provider.dart';
import '../views/home/home_views.dart';
import '../views/login/login_views.dart';
import '../views/onboarding/onboarding_views.dart';

class AppRoutes {
  static const String onboarding = '/onboarding';
  static const String home = '/home';
  static const String login = '/login';
  static const String splash = '/splash';
  static const String register = '/register';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onboarding:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (_) => OnboardingProvider(),
            child: const OnboardingScreen(),
          ),
        );

      case home:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (_) => HomeProvider(),
            child: const HomeScreen(),
          ),
        );

      case login:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (_) => LoginProvider(),
            child: const LoginScreen(),
          ),
        );
      case splash:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (_) => SplashProviders(),
            child: const SplashScreen(),
          ),
        );
      case register:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (_) => RegisterProviders(),
            child: const RegisterViews(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
