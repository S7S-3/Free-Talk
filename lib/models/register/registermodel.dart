class RegisterModel {
  String? email;
  String? password;
  String? confirmPassword;
  String? userName;
  String? message;
  String? code;
  String? description;

  RegisterModel(
      {this.email, this.password, this.confirmPassword, this.userName});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code =json['code'];
    description =json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['confirmPassword'] = confirmPassword;
    data['userName'] = userName;
    return data;
  }
}