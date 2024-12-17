import 'package:flutter/material.dart';
import 'package:free_talk/providers/home/home_provider.dart';
import 'package:provider/provider.dart';

import '../../utils/colors/color.dart';
import '../../utils/widgets/custom_bottom_nav_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashFactory: NoSplash.splashFactory, // Removes ripple effect
          highlightColor: Colors.transparent, // Removes highlight effect
        ),
        child: BottomNavigationBar(
          unselectedItemColor: AppColors.darkBlue,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            provider.bottomNav(index);
          },
          currentIndex: provider.currentScreen,
          selectedLabelStyle: const TextStyle(
              fontSize: 12,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              color: AppColors.darkBlue),
          unselectedLabelStyle: const TextStyle(
              fontSize: 12,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              color: AppColors.darkBlue),
          elevation: 0,
          backgroundColor: AppColors.white,
          items: [
            CustomBottomNavigationBarItem.create(icon: Icons.translate, label: 'Translate'),
            CustomBottomNavigationBarItem.create(icon: Icons.menu_book_outlined, label: 'Dictionary'),
            CustomBottomNavigationBarItem.create(icon: Icons.person, label: 'Account')
          ],
        ),
      ),
      body: provider.screens[provider.currentScreen],
    );
  }
}
