import 'package:flutter/cupertino.dart';

class AccountModel {
  final String? title;
  final String body;
  final IconData? prefixIcon;
  final IconData? suffix;

  AccountModel({
    this.title,
    required this.body,
    this.prefixIcon,
    this.suffix
  });
}