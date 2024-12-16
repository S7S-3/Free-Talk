import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../providers/onboarding/onboarding_provider.dart';
import '../../utils/colors/color.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OnboardingProvider>(context);
    final boardController = provider.boardController;
    final boarding = provider.boarding;
    
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Image(image: AssetImage('')))

        ],
      ),
    );
  }
}
