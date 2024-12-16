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
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.gulfBlue,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.gulfBlue),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.gulfBlue),
        ),
      ),
    );
  }
}
