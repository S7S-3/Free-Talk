import 'package:firebase_auth/firebase_auth.dart';

import '../../models/login/loginmodel.dart';
import '../helper/cache_helper.dart';

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future<void> login(LoginModel login) async {
    try {
      final response = await firebaseAuth.signInWithEmailAndPassword(
        email: login.email,
        password: login.password,
      );
      CacheHelper.saveData(key: 'uid', value: response.user?.uid);
    } on FirebaseAuthException catch (e) {
      throw extractFirebaseAuthError(e);
    } catch (e) {
      throw "An unexpected error occurred. Please try again.";
    }
  }
  Future<void> logout() async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      throw "An unexpected error occurred. Please try again.";
    }
  }
  Future<String> register(LoginModel login) async {
    try {
      final response = await firebaseAuth.createUserWithEmailAndPassword(
        email: login.email,
        password: login.password,
      );
      return response.user?.uid ?? '';
    }on FirebaseAuthException catch (e) {
      throw extractFirebaseAuthError(e);
    }
  }

  String extractFirebaseAuthError(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return "The email address is not valid.";
      case 'user-disabled':
        return "This user account has been disabled.";
      case 'user-not-found':
        return "No user found for this email.";
      case 'wrong-password':
        return "Incorrect password. Please try again.";
      case 'too-many-requests':
        return "We have blocked all requests from this device due to unusual activity. Try again later.";
      case 'network-request-failed':
        return "No internet connection. Please check your network.";
      default:
        return "Authentication failed. Please try again.";
    }
  }
}