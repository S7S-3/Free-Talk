import 'package:flutter/material.dart';
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
