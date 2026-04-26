class AuthSession {
  const AuthSession({
    required this.accessToken,
    this.refreshToken,
    this.tokenType = 'Bearer',
    this.expiresAt,
  });

  final String accessToken;
  final String? refreshToken;
  final String tokenType;
  final DateTime? expiresAt;

  String get authorizationHeader => '$tokenType $accessToken';

  bool get isExpired => expiresAt != null && DateTime.now().isAfter(expiresAt!);
}
