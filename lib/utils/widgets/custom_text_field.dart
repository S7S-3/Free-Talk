import 'package:flutter/material.dart';

import '../colors/color.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key, this.controller, this.validator, this.label,this.icon,required this.obscureText});
  TextEditingController? controller;
  String? label;
  FormFieldValidator? validator;
  Widget? icon;
  bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText?? false,
      controller: controller,
      cursorColor: AppColors.gulfBlue,
      validator: validator,
      decoration: InputDecoration(
        suffixIcon: icon,
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
    );
  }
}
