
class Profile {
  final String? resetPasswordToken;
  final DateTime? resetPasswordExpire;
  final String? photo;

  Profile({
    this.resetPasswordToken,
    this.resetPasswordExpire,
    this.photo,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      resetPasswordToken: json['reset_password_token'] as String?,
      resetPasswordExpire: json['reset_password_expire'] != null
          ? DateTime.tryParse(json['reset_password_expire'] as String)
          : null,
      photo: json['photo'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'reset_password_token': resetPasswordToken,
      'reset_password_expire':
      resetPasswordExpire?.toIso8601String(), // null => null
      'photo': photo,
    };
  }

  Profile copyWith({
    String? resetPasswordToken,
    DateTime? resetPasswordExpire,
    String? photo,
  }) {
    return Profile(
      resetPasswordToken: resetPasswordToken ?? this.resetPasswordToken,
      resetPasswordExpire: resetPasswordExpire ?? this.resetPasswordExpire,
      photo: photo ?? this.photo,
    );
  }
}

class User {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? username;
  final String? photo;
  final Profile? profile;

  User({
    this.firstName,
    this.lastName,
    this.email,
    this.username,
    this.photo,
    this.profile,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String?,
      username: json['username'] as String?,
      photo: json['photo'] as String?,
      profile: json['profile'] != null
          ? Profile.fromJson(json['profile'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'username': username,
      'photo': photo,
      'profile': profile?.toJson(),
    };
  }

  User copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? username,
    String? photo,
    Profile? profile,
  }) {
    return User(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      username: username ?? this.username,
      photo: photo ?? this.photo,
      profile: profile ?? this.profile,
    );
  }
}
