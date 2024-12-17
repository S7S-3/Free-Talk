import 'package:flutter/material.dart';

import '../../utils/colors/color.dart';

class CustomBottomNavigationBarItem {
  static BottomNavigationBarItem create({
    required IconData icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Container(
        width: 65,
        height: 35,
        decoration: ShapeDecoration(
          color: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Icon(
          icon,
          color: AppColors.darkBlue,
        ),
      ),
      activeIcon: Container(
        width: 65,
        height: 35,
        decoration: ShapeDecoration(
          gradient: const LinearGradient(
            begin: Alignment(0.00, -1.00),
            end: Alignment(0, 1),
            colors: [AppColors.gulfBlue, AppColors.darkBlue],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Icon(
          icon,
          color: AppColors.white,
        ),
      ),
      label: label,
    );
  }
}
