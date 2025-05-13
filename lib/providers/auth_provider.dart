import 'package:e_commerce/providers/storage_provider.dart';
import 'package:flutter/foundation.dart';

import '../main.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<bool> loginWithUserName(dynamic data, String username) async {
    final postData = await apiService.post("auth/login", data);
    _isLoading = false;

    if (postData != null) {
      if (postData.statusCode == 200) {
        // final userName = data['username'];
        _isLoading = true;
        getAllUsers(username);
        StorageProvider.i.setValueOnStorage("token", postData.data['token']);

        print(postData.data['token']);
        _isLoading = false;

        return true;
      } else {
        _isLoading = false;

        return false;
      }
    }
    notifyListeners();
    return false;
  }

  Future<bool> signUpWithEmail(Object data) async {
    final postData = await apiService.post('users', data);

    if (postData != null) {
      if (postData.statusCode == 200) {
        print(postData.data['id'].toString());
        StorageProvider.i
            .setValueOnStorage("id", postData.data["id"].toString());

        return true;
      } else {
        return false;
      }
    }

    return false;
  }

  Future<void> getAllUsers(String username) async {
    final res = await apiService.get("users");

    if (res!.statusCode == 200) {
      final data = res.data;
      for (final i in data) {
        if (i['username'] == username) {
          print(i);
          StorageProvider.i.setValueOnStorage("email", i["email"].toString());
          StorageProvider.i
              .setValueOnStorage("street", i["address"]["street"].toString());
          StorageProvider.i
              .setValueOnStorage("city", i["address"]["city"].toString());
          StorageProvider.i
              .setValueOnStorage("number", i["address"]["number"].toString());
          StorageProvider.i
              .setValueOnStorage("zipcode", i["address"]["zipcode"].toString());
          StorageProvider.i.setValueOnStorage("phone", i["phone"].toString());
          StorageProvider.i
              .setValueOnStorage("username", i["username"].toString());
          StorageProvider.i.setValueOnStorage("id", i["id"].toString());
        } else {
          print("Username does not exist");
        }
      }
    }
  }
}
