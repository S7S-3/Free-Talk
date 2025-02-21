import 'package:flutter/material.dart';
import 'package:free_talk/providers/home/home_provider.dart';
import 'package:provider/provider.dart';

import '../../utils/colors/color.dart';
import '../../utils/widgets/custom_bottom_nav_item.dart';
import '../routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          provider.titles[provider.currentScreen],
          style: const TextStyle(
              color: AppColors.tealBlue,
              fontSize: 32,
              fontWeight: FontWeight.w600),
        ),
      ),
      backgroundColor: AppColors.white,
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          color: AppColors.white,
        ),
        width: 60,
        height: 60,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: FloatingActionButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.chatbot);
            },
            backgroundColor: AppColors.tealBlue,
            child: const Icon(
              Icons.chat,
              color: AppColors.white,
            ),
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: AppColors.tealBlue,
        selectedItemColor: AppColors.tealBlue,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          provider.bottomNav(index);
        },
        currentIndex: provider.currentScreen,
        selectedLabelStyle: const TextStyle(
            fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.white),
        unselectedLabelStyle: const TextStyle(
            fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.white),
        elevation: 1.5,
        backgroundColor: AppColors.white,
        items: [
          CustomBottomNavigationBarItem.create(
              icon: Icons.translate, label: 'Translate'),
          CustomBottomNavigationBarItem.create(
              icon: Icons.menu_book_outlined, label: 'Dictionary'),
          CustomBottomNavigationBarItem.create(
              icon: Icons.person, label: 'Account'),
          CustomBottomNavigationBarItem.create(
              icon: Icons.settings, label: 'Settings')
        ],
      ),
      body: PageView(
        controller: provider.pageController,
        onPageChanged: (value) {
          provider.bottomNav(value);
        },
        children: provider.screens,
      ),
    );
  }
}
