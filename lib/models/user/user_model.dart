class UserModel {
  final String profile;
  final String name;
  final String email;

  UserModel({
    required this.profile,
    required this.name,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      profile: json['profile'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'profile': profile,
      'name': name,
      'email': email,
    };
  }
}
