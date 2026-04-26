class AuthSession {
  const AuthSession({
    required this.accessToken,
    this.refreshToken,
    this.tokenType = 'Bearer',
  });

  final String accessToken;
  final String? refreshToken;
  final String tokenType;

  String get authorizationHeader => '$tokenType $accessToken';
}
