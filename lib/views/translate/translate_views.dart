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
      padding: const EdgeInsets.symmetric( horizontal: 12),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Align(
              alignment: Alignment.bottomLeft, // Align to the bottom left
              child: Stack(
                alignment: Alignment.centerLeft, // Ensure the icons are still left-aligned
                children: [
                  TextFormField(
                    onChanged: (value) => provider.onTranslate(),
                    controller: provider.translateController,
                    cursorColor: AppColors.tealBlue,
                    decoration: InputDecoration(
                      hintText: "Type to translate",
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.camera_alt, size: 24),
                          color: AppColors.gallery,
                          style: const ButtonStyle(
                            backgroundColor:
                            WidgetStatePropertyAll(AppColors.tealBlue),
                            elevation: WidgetStatePropertyAll(1),
                          ),
                        ),
                      ),
                      fillColor: AppColors.gallery,
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
                          strokeAlign: BorderSide.strokeAlignCenter,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(55),
                        borderSide: const BorderSide(
                          color: AppColors.tealBlue,
                          width: 3,
                          strokeAlign: BorderSide.strokeAlignCenter,
                        ),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(55),
                        borderSide: const BorderSide(
                          color: AppColors.tealBlue,
                          width: 3,
                          strokeAlign: BorderSide.strokeAlignCenter,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(55),
                        borderSide: const BorderSide(
                          color: AppColors.tealBlue,
                          width: 3,
                          strokeAlign: BorderSide.strokeAlignCenter,
                        ),
                      ),
                      counterStyle: const TextStyle(
                        color: AppColors.tealBlue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.gallery,
                  borderRadius: BorderRadius.circular(20)),
              clipBehavior: Clip.antiAlias,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: ListView.separated(
                    itemBuilder: (context, index) => Column(
                      children: [
                        Text(provider.sentence[index].word),
                        GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 3,
                          children: [
                            for (int i = 0; i < provider.sentence[index].images.length; i++)
                              Image(image: AssetImage(provider.sentence[index].images[i]),height: 80,width: 50,),
                          ],
                        )
                      ],
                    ),
                    separatorBuilder:(context, index) =>  const SizedBox(height: 20,),
                    itemCount: provider.words.length
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
