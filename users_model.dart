import 'package:mongo_dart/mongo_dart.dart';

class UserModel {
  final ObjectId? id;
  final String? userName;
  final String? userNumber;
  final String? userPassword;

  UserModel(
      {this.id,
      required this.userName,
      required this.userNumber,
      required this.userPassword});

  Map<String, dynamic> toJson() {
    return {
      'name': userName,
      'number': userNumber,
      'password': userPassword,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json, ObjectId id) {
    return UserModel(
      id: id,
      userName: json['name'],
      userNumber: json['number'],
      userPassword: json['password'],
    );
  }
}
