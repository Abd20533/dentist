class User {
final int id;
final String firstName;
final String lastName;
final String email;
final String role;
final String phoneNumber;
final String? image; // يمكن أن تكون Null
final String? location; // يمكن أن تكون Null
final String? emailVerifiedAt; // يمكن أن تكون Null
final DateTime createdAt;
final DateTime updatedAt;

User({
required this.id,
required this.firstName,
required this.lastName,
required this.email,
required this.role,
required this.phoneNumber,
this.image,
this.location,
this.emailVerifiedAt,
required this.createdAt,
required this.updatedAt,
});

// Factory method to create a User from JSON
factory User.fromJson(Map<String, dynamic> json) {
  return User(
id: json['id'],
firstName: json['first_name'],
lastName: json['last_name'],
email: json['email'],
role: json['role'],
phoneNumber: json['phone_number'],
image: json['image'], // يمكن أن تكون null
location: json['location'], // يمكن أن تكون null
emailVerifiedAt: json['email_verified_at'],
createdAt: DateTime.parse(json['created_at']),
updatedAt: DateTime.parse(json['updated_at']),
);
}

// Method to convert a User to JSON
// Map<String, dynamic> toJson() {
// return {
// 'id': id,
// 'first_name': firstName,
// 'last_name': lastName,
// 'email': email,
// 'role': role,
// 'phone_number': phoneNumber,
// 'image': image,
// 'location': location,
// 'email_verified_at': emailVerifiedAt,
// 'created_at': createdAt.toIso8601String(),
// 'updated_at': updatedAt.toIso8601String(),
// };
// }
}

class AuthLoginResponse {
final User user;
final String token;

AuthLoginResponse({
required this.user,
required this.token,
});

// Factory method to create an AuthResponse from JSON
factory AuthLoginResponse.fromJson(Map<String, dynamic> json) {
return AuthLoginResponse(
user: User.fromJson(json['user']), // إنشاء كائن User من JSON
token: json['token'],
);
}

// // Method to convert AuthResponse to JSON
// Map<String, dynamic> toJson() {
// return {
// 'user': user.toJson(), // تحويل كائن User إلى JSON
// 'token': token,
// };
// }
}