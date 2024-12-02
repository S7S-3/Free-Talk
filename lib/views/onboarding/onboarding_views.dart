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

    if (boarding.isEmpty) {
      return const Scaffold(
        body: Center(child: Text("No onboarding data available")),
      );
    }

    return Scaffold(
      body: Column(
        children: [
          const Image(
            image: AssetImage('assets/avatar.png'),
            fit: BoxFit.cover,
          ),
          Expanded(
            child: PageView.builder(
              controller: boardController,
              onPageChanged:provider.updateCurrentPage,
              itemCount: boarding.length,
              itemBuilder: (context, index) {
                final boardItem = boarding[index];
                return Container(
                  color: AppColors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            boardItem.title,
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 14),
                          Text(
                            boardItem.body,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),

          ),
          Container(
            color: AppColors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmoothPageIndicator(
                    controller: boardController,
                    effect: const ExpandingDotsEffect(
                      dotColor: AppColors.gulfBlue,
                      activeDotColor: AppColors.gulfBlue,
                      dotHeight: 15,
                      dotWidth: 15,
                      spacing: 5,
                    ),
                    count: boarding.length,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (provider.currentPage < boarding.length - 1) {
                        boardController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        provider.completeOnboarding(context);
                      }
                    },
                    child: Row(
                      children: [
                        Text(
                          provider.currentPage < boarding.length - 1
                              ? "Next"
                              : "Let’ s Start",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: AppColors.gulfBlue,
                          ),
                        ),
                        const SizedBox(width: 14,),
                        const Icon(
                          Icons.double_arrow_rounded,
                          color: AppColors.gulfBlue,
                          size: 20,
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
