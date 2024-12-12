import 'package:flutter/material.dart';

import '../../utils/colors/color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
        }, icon:const Icon(Icons.menu,color: AppColors.gulfBlue,) ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const [
        BottomNavigationBarItem(
        icon: Icon(
          Icons.translate,
          color: AppColors.gulfBlue,
        ),
        label: 'Translate',
      ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.book_outlined,
            color: AppColors.gulfBlue,
          ),
          label: 'Dictionary',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: AppColors.gulfBlue,
          ),
          label: 'Account',
        ),
      ],

      ),
      body: const Center(child: Text('Welcome to the Home Screen!')),
    );
  }
}
