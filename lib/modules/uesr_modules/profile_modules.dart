class UserProfile {
  final int? id;
  final String ?firstName;
  final String ?lastName;
  final String ?email;
  final String? role;
  final String? phoneNumber;
  final String? image;
  final String? location;
  final String? emailVerifiedAt;
  // final DateTime createdAt;
  // final DateTime updatedAt;

  UserProfile({
     this.id,
     this.firstName,
     this.lastName,
     this.email,
     this.role,
     this.phoneNumber,
    this.image,
    this.location,
    this.emailVerifiedAt,
    // required this.createdAt,
    // required this.updatedAt,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json["user"]['id'],
      firstName: json["user"]['first_name'],
      lastName: json["user"]['last_name'],
      email: json["user"]['email'],
      role: json["user"]['role'],
      phoneNumber: json["user"]['phone_number'],
      image: json["user"]['image'],
      location: json["user"]['location'],
      emailVerifiedAt: json["user"]['email_verified_at'],
      // createdAt: DateTime.parse(json['created_at']),
      // updatedAt: DateTime.parse(json['updated_at']),
    );
  }
  //     : {user: {id: 10, first_name: abdab, last_name: Kenani, email: syriatel887s@gmail.com, role: user, phone_number: 0859746312, image: null, location: null, email_verified_at: null, created_at: 2025-01-10T12:34:55.000000Z, updated_at: 2025-01-10T12:34:55.000000Z}}
  // I/flutter ( 6251):  ok profile
  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'first_name': firstName,
  //     'last_name': lastName,
  //     'email': email,
  //     'role': role,
  //     'phone_number': phoneNumber,
  //     'image': image,
  //     'location': location,
  //     'email_verified_at': emailVerifiedAt,
  //     'created_at': createdAt.toIso8601String(),
  //     'updated_at': updatedAt.toIso8601String(),
  //   };
  // }
}
