import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final storage = FlutterSecureStorage();

  Future readSecureData(String key) async {
    var readData = await storage.read(key: key);
    return readData;
  }

  Future writeSecureData(userToken) async {
    await storage.write(key: 'token', value: userToken);

  }

  Future deleteSecureData() async {
    await storage.deleteAll();
  }
}
