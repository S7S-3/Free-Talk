import 'package:flutter/material.dart';
import 'package:free_talk/models/translate_model/translate_model.dart';
import 'package:free_talk/views/account/account_views.dart';
import 'package:free_talk/views/search/search_views.dart';
import 'package:free_talk/views/translate/translate_views.dart';

import '../../models/account/account_model.dart';

class HomeProvider extends ChangeNotifier {
  final translateController = TextEditingController();
  final searchController = TextEditingController();
  final accountScrollController =ScrollController();
  final pageController=PageController();
  var words = <String>[];
  var images = <String>[];
  List<TranslateModel> sentence = [];

  int currentScreen=0;
  List<Widget> screens=[
    const TranslateScreen(),
    const SearchScreen(),
    const Text('chat'),
    const AccountScreen(),
  ];
  List<String> titles=[
    'Translate',
    'Dictionary',
    'Chat Bot',
    'Account',
  ];
  void bottomNav(int index){
    currentScreen=index;
    pageController.jumpToPage(index);
    notifyListeners();
  }
  List<AccountModel> account=[
    AccountModel(title: 'E-mail', body: 'minasafwat594@gmail.com',suffix: null,prefixIcon: null),
    AccountModel(title: 'Name', body: 'Mina Safwat', suffix: Icons.edit_outlined,prefixIcon: null),
    AccountModel(title: 'Profile', body: 'Not identified', suffix: Icons.edit_outlined,prefixIcon: null)
  ];
  List<AccountModel> help=[
    AccountModel( body: 'Frequently asked questions', prefixIcon: Icons.question_mark,suffix: Icons.keyboard_arrow_right,title: null),
    AccountModel( body: 'Make comments', prefixIcon: Icons.mode_comment_outlined,suffix: Icons.keyboard_arrow_right,title: null),
  ];
  List<AccountModel> about=[
    AccountModel( body: 'Terms of use', prefixIcon: Icons.file_open_outlined,suffix: Icons.keyboard_arrow_right,title: null),
    AccountModel( title: 'version',body: '1.0.0(1)',prefixIcon: null,suffix: null),
  ];

  List<String> getWords(String sentence) {
    return sentence.split(RegExp(r'\s+')).where((word) => word.isNotEmpty).toList();
  }

  void onTranslate(){
    sentence=[];
    var text=translateController.text;
    words = getWords(text);
    for (String word in words) {
      images=[];
      for (int i = 0; i < word.length; i++) {
        images.add("assets/signs/${word[i].toLowerCase()}.png");
      }
      sentence.add(TranslateModel(word: word, images: images) );
    }
    notifyListeners();
  }
}
