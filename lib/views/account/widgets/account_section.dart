import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/home/home_provider.dart';
import '../../../utils/colors/color.dart';

class AccountSection extends StatelessWidget {
  const AccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            'Account',
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
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
         height: 250,
         width: double.infinity,
          decoration: ShapeDecoration(
            gradient: const LinearGradient(
              begin: Alignment(0.00, -1.00),
              end: Alignment(0, 1),
              colors: [AppColors.gulfBlue, AppColors.darkBlue],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,bottom:8 ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                      provider.account[index].title!,
                        style: const TextStyle(
                          color: AppColors.silverChalice,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        provider.account[index].body,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  provider.account[index].suffix!=null? IconButton(onPressed: (){}, icon: const Icon(size: 24,Icons.edit,color: AppColors.white,)):const SizedBox()
                ],
              ),
            ),
            separatorBuilder: (context, index) => const Padding(
              padding: EdgeInsets.symmetric(horizontal:14 ),
              child: Divider(color: AppColors.white,thickness: 1,),
            ),
          ),
        )
      ],
    );
  }
}
