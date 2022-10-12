import 'dart:io';
import 'package:chinese_learning/features/authentication/data/model/user_model.dart';
import 'package:http/http.dart' as http;
import '../../../../main.dart';

//User Profile
class UserDetailsAPI {
  Future<List<UserModel>> getUserDetails() async {
    try {
      //read token form storage
      var token = await secureStorage.readSecureData('token');

      final response = await http.get(
          Uri.parse(
              "http://namaste-china-app.herokuapp.com/api/user/get_current_user/"),
          headers: <String, String>{
            'Authorization': 'Token $token',
          });

      if (response.statusCode == 200) {
        final vocabularyModel = userModelFromJson(response.body);
        return vocabularyModel;
      } else {
        final vocabularyModel = userModelFromJson(response.body);

        return vocabularyModel;
      }
    } on SocketException catch (_) {
      return Future.error('No network found');
    } catch (_) {
      return Future.error('Something occured');
    }
  }
}
