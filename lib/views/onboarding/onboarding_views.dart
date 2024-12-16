import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../providers/onboarding/onboarding_provider.dart';
import '../../utils/colors/color.dart';
import '../../utils/widgets/custom_boarding_item.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OnboardingProvider>(context);
    final boardController = provider.boardController;
    final boarding = provider.boarding;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Expanded(
            flex: 59,
            child: Image(
              image: AssetImage('assets/images/avatar.png'),
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            flex: 49,
            child: PageView.builder(
              controller: boardController,
              onPageChanged:provider.updateCurrentPage,
              itemBuilder: (context, index) => CustomBoardingItem(
                title: boarding[index].title,
                subTitle: boarding[index].body,
              ),
              itemCount: boarding.length,
              physics: const BouncingScrollPhysics(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, bottom: 26),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  effect: const ExpandingDotsEffect(
                    dotColor: AppColors.gulfBlue,
                    activeDotColor: AppColors.darkBlue,
                    dotHeight: 20,
                    dotWidth: 20,
                  ),
                  count: boarding.length,
                ),
                const Spacer(),
                GestureDetector(
                  onTap: (){
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
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Next',
                        style: TextStyle(
                          foreground: Paint()
                            ..shader = const LinearGradient(
                              colors: [
                                AppColors.gulfBlue,
                                AppColors.darkBlue,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ).createShader(const Rect.fromLTWH(0, 0, 200, 50)),
                          fontSize: 30,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 0.05,
                        ),
                      ),
                      ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return const LinearGradient(
                            colors: [
                              AppColors.gulfBlue,
                              AppColors.darkBlue,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ).createShader(bounds);
                        },
                        blendMode: BlendMode.srcIn,
                        child: const Icon(
                          Icons.keyboard_double_arrow_right_outlined,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
