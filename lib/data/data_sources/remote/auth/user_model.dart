
class UserModel {
  late final dynamic message;
  late final User user;
  late final int? statusCode;

  UserModel(
    this.user,
    this.message,
  );
//Map<String, dynamic>
  UserModel.formJson(dynamic json, int myStatusCode) {
    statusCode = myStatusCode!;

    message = json['message'];
    user = User.fromJson(json['data']);
  }
}

class User {
  late dynamic name;
  late dynamic token;
  late dynamic email;
  late dynamic age;
  late dynamic roleId;
  late dynamic evaluation;

  User({required this.name, required this.token});
  User.fromJson(dynamic json) {
    if (json['name'] == null) {
      print(1);
    }
    if (json['token'] == null) {
      print(2);
    }
    if (json['email'] == null) {
      print(3);
    }
    if (json['role_id'] == null) {
      print(4);
    }
    if (json['evaluation'] == null) {
      print(5);
    }
    name = json['name'];
    token = json['token'];

    email = json['email'];
    age = json['age'];
    roleId = json['role_id'];
    evaluation = json['evaluation'];
  }
}
