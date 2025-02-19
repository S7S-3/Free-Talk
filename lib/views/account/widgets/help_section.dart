import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/home/home_provider.dart';
import '../../../utils/colors/color.dart';

class HelpSection extends StatelessWidget {
  const HelpSection({super.key});

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
            'Help',
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
            padding: const EdgeInsets.symmetric(vertical: 14.0),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,bottom:8 ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                     Row(
                       children: [
                         Icon(provider.help[index].prefixIcon,color: AppColors.gallery,),
                         const SizedBox(
                           width: 10,
                         ),
                         Text(
                           provider.help[index].body,
                           style: const TextStyle(
                             color: Colors.white,
                             fontSize: 16,
                             fontWeight: FontWeight.w600,
                           ),
                         ),
                       ],
                     ),
                    IconButton(onPressed: (){}, icon:  Icon(size: 24,provider.help[index].suffix,color: AppColors.gallery,))
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
