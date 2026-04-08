class PasswordHistory {
  const PasswordHistory({
    required this.id,
    required this.password,
    required this.createdAt,
  });

  final String id;
  final String password;
  final DateTime createdAt;
}
