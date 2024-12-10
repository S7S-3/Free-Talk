import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:free_talk/providers/splash/splash_providers.dart';
import 'package:free_talk/utils/colors/color.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SplashProviders>(context).navigateAfterDelay(context);
    return const Scaffold(
      backgroundColor: AppColors.gulfBlue,
      body: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Image(
              image: AssetImage("assets/images/free_talk_white.png",),
              width: 120,
              height: 120,
            ),
            Text(
              "Free Talk",
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.w400,
                color: AppColors.white,
                fontFamily: 'SendFlowers',
              ),
            ),
          ],
        )
      ),
    );
  }
}
