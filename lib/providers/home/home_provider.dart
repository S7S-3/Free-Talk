import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:free_talk/models/translate_model/translate_model.dart';
import 'package:free_talk/services/firebase/user_service.dart';
import 'package:free_talk/utils/widgets/custom_snackbar.dart';
import 'package:free_talk/views/account/account_views.dart';
import 'package:free_talk/views/search/search_views.dart';
import 'package:free_talk/views/translate/translate_views.dart';
import '../../models/account/account_model.dart';
import '../../models/user/user_model.dart';
import '../../services/firebase/auth_service.dart';
import '../../views/routes.dart';

class HomeProvider extends ChangeNotifier {
  final translateController = TextEditingController();
  final searchController = TextEditingController();
  final accountScrollController =ScrollController();
  final pageController=PageController();
  var words = <String>[];
  var images = <String>[];
  var isLoaded=false;
  var uid=FirebaseAuth.instance.currentUser?.uid;
  var user = UserModel(
    email: "",
    name: "",
    profile: "0"
  );
  List<TranslateModel> sentence = [];

  int currentScreen=0;
  List<Widget> screens=[
    const TranslateScreen(),
    const SearchScreen(),
    const AccountScreen(),
    const Text('setting'),
  ];
  List<String> titles=[
    'Translate',
    'Dictionary',
    'Account',
    'Setting',
  ];
  HomeProvider(){
    getData();
  }
  void bottomNav(int index){
    currentScreen=index;
    pageController.jumpToPage(index);
    notifyListeners();
  }
  List<AccountModel> account=[
    AccountModel(title: 'E-mail', value: '',suffix: Icons.edit_outlined,prefixIcon: null),
    AccountModel(title: 'Name', value: '', suffix: Icons.edit_outlined,prefixIcon: null),
  ];
  List<AccountModel> help=[
    AccountModel( value: 'Frequently asked questions', prefixIcon: Icons.question_mark,suffix: Icons.keyboard_arrow_right,title: null),
    AccountModel( value: 'Make comments', prefixIcon: Icons.mode_comment_outlined,suffix: Icons.keyboard_arrow_right,title: null),
  ];
  List<AccountModel> about=[
    AccountModel( value: 'Terms of use', prefixIcon: Icons.file_open_outlined,suffix: Icons.keyboard_arrow_right,title: null),
    AccountModel( title: 'version',value: '1.0.0(1)',prefixIcon: null,suffix: null),
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
  void logout(BuildContext context) async {
    try {
      await AuthService().logout();
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.login,
        (route) => false,
      );
    }catch (e){
      showCustomSnackBar(context, "An unexpected error occurred");
    }
  }

  void getData()async{
    isLoaded=true;
    try{
      user =  await UserService().getData(uid??'');
    }finally{
      isLoaded=false;
      account[0].value=user.email;
      account[1].value=user.name;
    }
  }
}
