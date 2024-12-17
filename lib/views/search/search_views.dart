import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/home/home_provider.dart';
import '../../utils/colors/color.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 12),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Dictionary',
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
                fontSize: 64,
                fontWeight: FontWeight.w600),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.gallery,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: TextFormField(
                      controller: provider.translateController,
                      cursorColor: AppColors.gulfBlue,
                      decoration: InputDecoration(
                          fillColor: AppColors.white,
                          filled: true,
                          labelText: 'Search',
                          labelStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: AppColors.gray,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                                color: AppColors.darkBlue,
                                width: 3,
                                strokeAlign: BorderSide.strokeAlignCenter),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                                color: AppColors.darkBlue,
                                width: 3,
                                strokeAlign: BorderSide.strokeAlignCenter),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                                color: AppColors.darkBlue,
                                width: 3,
                                strokeAlign: BorderSide.strokeAlignCenter),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                                color: AppColors.darkBlue,
                                width: 3,
                                strokeAlign: BorderSide.strokeAlignCenter),
                          ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),

        ],
      ),
    );
  }
}
