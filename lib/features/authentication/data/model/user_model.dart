//User API model
import 'dart:convert';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  int? id;
  String? email;
  String? userName;
  String? phoneNumber;
  String? userType;

  UserModel({
    this.id,
    this.email,
    this.userName,
    this.phoneNumber,
    this.userType,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        email: json['email'],
        userName: json['user_name'],
        phoneNumber: json['phone_number'],
        userType: json['user_type'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'user_name': userName,
        'phone_number': phoneNumber,
      };
}
