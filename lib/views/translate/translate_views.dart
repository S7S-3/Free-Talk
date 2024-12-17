import 'package:flutter/material.dart';
import 'package:free_talk/providers/home/home_provider.dart';
import 'package:provider/provider.dart';

import '../../utils/colors/color.dart';

class TranslateScreen extends StatelessWidget {
  const TranslateScreen({super.key});

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
            'Translate',
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
                  color: AppColors.gray,
                  borderRadius: BorderRadius.circular(20)),
              clipBehavior: Clip.antiAlias,
              child: const Image(image: AssetImage('assets/images/avatar.png'),height: double.infinity,fit: BoxFit.fitHeight,
              width: double.infinity,),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          TextFormField(
            controller: provider.translateController,
            cursorColor: AppColors.gulfBlue,
            decoration: InputDecoration(
                fillColor: AppColors.white,
                filled: true,
                labelText: 'Type to translate',
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
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7,horizontal: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.camera_alt,size: 24,),
                        color: AppColors.white,
                        style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(AppColors.darkBlue)),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.mic,size: 24,),
                        color: AppColors.white,
                        style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(AppColors.darkBlue)),
                      ),
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
