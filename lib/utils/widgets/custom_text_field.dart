import 'package:flutter/material.dart';

import '../colors/color.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField({super.key, this.controller, this.validator, this.label,this.icon,required this.obscureText, this.hintText});
  TextEditingController? controller;
  String? label;
  FormFieldValidator? validator;
  Widget? icon;
  bool? obscureText;
  String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText?? false,
      controller: controller,
      cursorColor: AppColors.tealBlue,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: icon,
        fillColor: AppColors.gallery,
        filled: true,
        labelText: label,
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
    );
  }
}
