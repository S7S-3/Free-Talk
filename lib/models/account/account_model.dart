import 'package:flutter/cupertino.dart';

class AccountModel {
  final String? title;
  String? value;
  final IconData? prefixIcon;
  final IconData? suffix;

  AccountModel({
    this.title,
    this.value,
    this.prefixIcon,
    this.suffix
  });
}