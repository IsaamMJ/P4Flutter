class LoginResult {
  final String status;
  final String message;
  final String? token; // Nullable for non-success cases

  LoginResult({
    required this.status,
    required this.message,
    this.token,
  });
}
