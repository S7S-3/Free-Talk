import 'package:flutter/material.dart';
import 'package:free_talk/views/account/account_views.dart';
import 'package:free_talk/views/search/search_views.dart';
import 'package:free_talk/views/translate/translate_views.dart';

class HomeProvider extends ChangeNotifier {
  final translateController = TextEditingController();

  int currentScreen=0;
  List<Widget> screens=[
    const TranslateScreen(),
    const SearchScreen(),
    const AccountScreen(),
  ];
  void bottomNav(int index){
    currentScreen=index;
    notifyListeners();
  }
}
