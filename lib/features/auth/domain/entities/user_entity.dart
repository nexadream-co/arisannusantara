class UserEntity {
  final String id;
  final String email;
  final bool emailVerified;
  final String role; // 'admin' or 'superadmin'

  const UserEntity({
    required this.id,
    required this.email,
    required this.role,
    this.emailVerified = true,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
    id: json['id'] as String,
    email: json['email'] as String,
    role: json['role'] as String,
  );

  Map<String, dynamic> toJson() => {'id': id, 'email': email, 'role': role};
}
