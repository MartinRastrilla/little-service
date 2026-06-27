class AppRole {
  final String name;
  const AppRole({required this.name});
}

class AppUser {
  final String id;
  final String name;
  final String email;
  final List<AppRole> roles;

  const AppUser({
    required this.id,
    required this.name,
    required this.email,
    required this.roles,
  });

  bool get isClient => roles.any((role) => role.name.toLowerCase() == 'client');
  bool get isFreelancer =>
      roles.any((role) => role.name.toLowerCase() == 'freelancer');
}
