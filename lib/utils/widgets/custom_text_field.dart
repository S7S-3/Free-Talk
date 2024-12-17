import 'package:flutter/material.dart';

import '../colors/color.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key,
  this.controller,
  this.label});
  TextEditingController? controller;
  String? label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColors.gulfBlue,
      decoration: InputDecoration(
        fillColor: AppColors.white,
        filled: true,
        labelText: label,
        labelStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: AppColors.gray,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.darkBlue,width: 3,strokeAlign: BorderSide.strokeAlignCenter),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.darkBlue,width: 3,strokeAlign: BorderSide.strokeAlignCenter),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.darkBlue,width: 3,strokeAlign: BorderSide.strokeAlignCenter),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.darkBlue,width: 3,strokeAlign: BorderSide.strokeAlignCenter),
        ),
      ),
    );
  }
}
