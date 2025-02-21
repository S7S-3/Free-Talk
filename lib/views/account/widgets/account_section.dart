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
        const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(
            'Account',
            style: TextStyle(
              color: AppColors.tealBlue,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
         width: double.infinity,
          decoration: ShapeDecoration(
            color: AppColors.tealBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 2,
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
                          provider.account[index].value??'',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                    provider.account[index].suffix!=null? IconButton(onPressed: (){}, icon: const Icon(size: 24,Icons.edit,color: AppColors.gallery,)):const SizedBox()
                  ],
                ),
              ),
              separatorBuilder: (context, index) => const Padding(
                padding: EdgeInsets.symmetric(horizontal:14 ),
                child: Divider(color: AppColors.gallery,thickness: 1,),
              ),
            ),
          ),
        )
      ],
    );
  }
}
