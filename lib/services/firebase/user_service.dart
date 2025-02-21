import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/user/user_model.dart';


class UserService {
  Future<UserModel> getData(String uid) async {
    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('Users')
          .doc(uid)
          .get();
      if (userDoc.exists) {
        return UserModel.fromJson(userDoc.data() as Map<String, dynamic>);
      }
    } catch (e) {
      return UserModel(profile: "0", name: '', email: '');
    }
    return UserModel(profile: "0", name: '', email: '');
  }
  Future<void> setData(UserModel user, String uid) async {
    try {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(uid)
          .set(user.toJson());
    }
    catch (e) {
      print(e);
    }
  }
}