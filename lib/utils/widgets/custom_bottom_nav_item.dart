import 'package:flutter/material.dart';

import '../../utils/colors/color.dart';

class CustomBottomNavigationBarItem {
  static BottomNavigationBarItem create({
    required IconData icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: AppColors.tealBlue,
      ),
      activeIcon: Container(
        width: 65,
        height: 35,
        decoration: ShapeDecoration(
          color: AppColors.tealBlue,
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
