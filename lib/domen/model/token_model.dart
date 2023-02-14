class TokenModel {
  final String token;
  final String? refreshToken;

  TokenModel({
    required this.token,
    required this.refreshToken,
  });

  factory TokenModel.fromJson(Map data) {
    return TokenModel(
        token: data["access_token"], refreshToken: data["refresh_token"]);
  }
}