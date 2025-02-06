class User {
  String name;
  String? email;
  String? country;
  String? city;
  String? street;

  User({
    required this.name,
    this.email,
    this.country,
    this.city,
    this.street,
  });
}

extension UserExtension on User {
  String getFullInfo() {
    return '''
    name: $name
    email: ${email ?? "Unspecified"}
    country: ${country ?? "Unspecified"}
    city: ${city ?? "Unspecified"}
    street: ${street ?? "Unspecified"}
    ''';
  }
}

void main() {
  User user = User(
    name: "Alice",
    email: "alice@gmail.com",
    country: "Germany",
    city: "Munich",
  );

  User user2 = User(
    name: "Alice",
  );

  print(user.getFullInfo());
  print(user2.getFullInfo());
}
