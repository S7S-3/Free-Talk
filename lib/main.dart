import 'package:flutter/material.dart';

import 'presentations/screens/login/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LoginScreen.routeName: (context)=>const LoginScreen(),

      },
      initialRoute: LoginScreen.routeName,
      debugShowCheckedModeBanner: false,
    );
  }
}
