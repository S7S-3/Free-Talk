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
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title:  Text(
          provider.titles[provider.currentScreen],
          style: const TextStyle(
            color: AppColors.tealBlue,
            fontSize: 32,
            fontWeight: FontWeight.w600
          ),
        ),
      ),
      backgroundColor: AppColors.white,
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: AppColors.tealBlue,
          selectedItemColor: AppColors.tealBlue,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            provider.bottomNav(index);
          },
          currentIndex: provider.currentScreen,
          selectedLabelStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.white),
          unselectedLabelStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.white),
          elevation: 1.5,
        backgroundColor: AppColors.white,
          items: [
            CustomBottomNavigationBarItem.create(icon: Icons.translate, label: 'Translate'),
            CustomBottomNavigationBarItem.create(icon: Icons.menu_book_outlined, label: 'Dictionary'),
            CustomBottomNavigationBarItem.create(icon: Icons.chat_outlined, label: 'Chat bot'),
            CustomBottomNavigationBarItem.create(icon: Icons.person, label: 'Account')
          ],
        ),
      body: PageView(
        controller: provider.pageController,
        onPageChanged: (value) {
          provider.bottomNav(value);
        },
        children:provider.screens,
      ),
    );
  }
}
