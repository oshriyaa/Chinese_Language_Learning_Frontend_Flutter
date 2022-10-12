import 'package:chinese_learning/features/authentication/data/model/user_model.dart';
import 'package:flutter/cupertino.dart';

import '../data/datasource/userdata_service.dart';

class ProfileProvider extends ChangeNotifier {
  List<UserModel>? _userData;
  List<UserModel>? get userData => _userData;

  fetchUserData() async {
    var userProfile = await UserDetailsAPI().getUserDetails();
    _userData = userProfile;
  }
}
