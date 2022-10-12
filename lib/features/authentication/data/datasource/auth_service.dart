// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';
import 'package:chinese_learning/main.dart';
import 'package:http/http.dart' as http;

class AuthService {
  //API service for login
  static Future login(email, password) async {
    var requestBody = {'username': '$email', 'password': '$password'};
    var decodedResponse;
    //sending API request for login
    final response = await http.post(
        Uri.parse("http://namaste-china-app.herokuapp.com/token/"),
        headers: <String, String>{
          'Content_Type': 'application/json',
        },
        body: requestBody);
    //if the login is successful
    if (response.statusCode == 200) {
      decodedResponse = json.decode(response.body);

      var token = decodedResponse['token'];
      secureStorage.writeSecureData(token);

      return decodedResponse;
    }
    //if the login is unseccessful
    return null;
  }

  //API service for Register
  static Future register(fullName, phoneNumber, email, password) async {
    var requestBody = {
      'email': '$email',
      'user_name': '$fullName',
      'phone_number': '$phoneNumber',
      'password': '$password'
    };

    var decodedResponse;

    final response = await http.post(
        Uri.parse("http://namaste-china-app.herokuapp.com/api/user/create/"),
        headers: <String, String>{
          'Content_Type': 'application/json',
        },
        body: requestBody);

    if (response.statusCode == 201) {
      decodedResponse = json.decode(response.body);
      return decodedResponse;
    }
    return null;
  }
}
