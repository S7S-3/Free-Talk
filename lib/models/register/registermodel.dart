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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['confirmPassword'] = this.confirmPassword;
    data['userName'] = this.userName;
    return data;
  }
}