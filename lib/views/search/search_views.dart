import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/home/home_provider.dart';
import '../../utils/colors/color.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context);
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 8),
          child: TextFormField(
            controller: provider.searchController,
            cursorColor: AppColors.tealBlue,
            decoration: InputDecoration(
              hintText: "Search",
              fillColor: AppColors.gallery,
              filled: true,
              labelText: 'Search',
              labelStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: AppColors.gray,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(55),
                borderSide: const BorderSide(
                    color: AppColors.tealBlue,
                    width: 3,
                    strokeAlign: BorderSide.strokeAlignCenter),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(55),
                borderSide: const BorderSide(
                    color: AppColors.tealBlue,
                    width: 3,
                    strokeAlign: BorderSide.strokeAlignCenter),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(55),
                borderSide: const BorderSide(
                    color: AppColors.tealBlue,
                    width: 3,
                    strokeAlign: BorderSide.strokeAlignCenter),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(55),
                borderSide: const BorderSide(
                    color: AppColors.tealBlue,
                    width: 3,
                    strokeAlign: BorderSide.strokeAlignCenter),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.gallery,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [

                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
