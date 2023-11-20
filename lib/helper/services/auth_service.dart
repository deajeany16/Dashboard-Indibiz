import 'package:get/get.dart';
import 'package:webui/helper/services/api_client.dart';
import 'package:webui/helper/storage/local_storage.dart';

class AuthService extends ApiClient {
  static bool isLoggedIn = false;

  // static Future<Map<String, String>?> loginUser(
  //     Map<String, dynamic> data) async {
  //   await Future.delayed(Duration(seconds: 1));
  //   if (data['email'] != dummyUser.email) {
  //     return {"email": "This email is not registered"};
  //   } else if (data['password'] != "1234567") {
  //     return {"password": "Password is incorrect"};
  //   }

  //   return null;
  //   isLoggedIn = true;
  //   await LocalStorage.setLoggedInUser(true);
  // }

  Future<Response> login(dynamic body) async {
    try {
      var response = await post("users/login", body);
      isLoggedIn = true;
      // var resJson = json.decode(response.body);
      String token = response.body["token"];
      String hakAkses = response.body["hak_akses"];
      await LocalStorage.setToken(token);
      await LocalStorage.setLoggedInUser(true);
      await LocalStorage.setHakAkses(hakAkses);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getAllUsersByAdmin() async {
    try {
      var token = LocalStorage.getToken();
      var response = await get(
        "users/admin",
        headers: {
          'Authorization': 'Bearer $token', //carrier
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getAllUsersBySales() async {
    try {
      var token = LocalStorage.getToken();
      var response = await get(
        "users/sales",
        headers: {
          'Authorization': 'Bearer $token', //carrier
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getAllUsersByInputer() async {
    try {
      var token = LocalStorage.getToken();
      var response = await get(
        "users/inputer",
        headers: {
          'Authorization': 'Bearer $token', //carrier
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
