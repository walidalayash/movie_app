class TokenExpiredException implements Exception {
  final String message;

  const TokenExpiredException(this.message);
}
