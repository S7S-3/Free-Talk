class LoginModel {
  String password;
  String email;


  LoginModel({required this.password,required this.email});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['password'] = password;
    data['email'] = email;
    return data;
  }
}