class User {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final DateTime updatedAt;
  final DateTime createdAt;
  final int id;

  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  // Factory method to create a User from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      phoneNumber: json['phone_number'],
      updatedAt: DateTime.parse(json['updated_at']),
      createdAt: DateTime.parse(json['created_at']),
      id: json['id'],
    );
  }

  // Method to convert a User to JSON
  // Map<String, dynamic> toJson() {
  //   return {
  //     'first_name': firstName,
  //     'last_name': lastName,
  //     'email': email,
  //     'phone_number': phoneNumber,
  //     'updated_at': updatedAt.toIso8601String(),
  //     'created_at': createdAt.toIso8601String(),
  //     'id': id,
  //   };
  // }
}


class AuthResponse {
  final User user;
  final String token;

  AuthResponse({
    required this.user,
    required this.token,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      user: User.fromJson(json['user']), // استخدام User.fromJson لتحويل بيانات المستخدم
      token: json['token'],
    );
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'user': user.toJson(), // استخدام user.toJson لتحويل بيانات المستخدم إلى JSON
  //     'token': token,
  //   };
  // }
}
