import 'package:flutter/material.dart';

import '../colors/color.dart';

class CustomBoardingItem extends StatelessWidget {
  CustomBoardingItem({super.key,required this.title,required this.subTitle});
  String title;
  String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 19,left: 30,right: 30),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
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
              fontSize: 35,
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
      const SizedBox(height: 70,),
      Text(
        subTitle,
      style: const TextStyle(
      color: AppColors.gray,
      fontSize: 20,
      fontWeight: FontWeight.w300,
      height: 0,
    ),
    )
        ],
      ),
    );
  }
}
