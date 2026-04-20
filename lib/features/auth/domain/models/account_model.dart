class AccountModel {
  final String userId;
  final String accessToken;
  final String refreshToken;

  const AccountModel({
    required this.userId,
    required this.accessToken,
    required this.refreshToken,
  });

  static Map<String, dynamic> toJson(String email, String password) {
    final trimmedEmail = email.trim();
    final trimmedPassword = password.trim();
    return {'email': trimmedEmail, 'password': trimmedPassword};
  }

  static AccountModel fromJson(Map<String, dynamic> json) {
    final userId = json['user'] ?? {};

    return AccountModel(
      userId: userId['id'] ?? '',
      accessToken: json['access_token'] ?? '',
      refreshToken: json['refresh_token'] ?? '',
    );
  }
}
