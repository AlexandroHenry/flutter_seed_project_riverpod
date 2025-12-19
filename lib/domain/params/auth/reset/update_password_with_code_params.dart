class UpdatePasswordWithCodeParams {
  const UpdatePasswordWithCodeParams({
    required this.email,
    required this.code,
    required this.newPassword,
  });

  final String email;
  final String code;
  final String newPassword;
}


