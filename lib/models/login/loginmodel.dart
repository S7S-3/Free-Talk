class LoginModel {
  String? password;
  String? userName;
  String? token;
  String? expiration;

  LoginModel({this.password, this.userName});

  LoginModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    expiration = json['expiration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['password'] = this.password;
    data['userName'] = this.userName;
    return data;
  }
}