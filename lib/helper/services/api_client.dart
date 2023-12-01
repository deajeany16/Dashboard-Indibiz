import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class ApiClient extends GetConnect {
  @override
  void onInit() {
    //1.base_url
    httpClient.baseUrl = "https://bskaltengapi.xyz/";
    //2.
    httpClient.defaultContentType = "application/json";
    httpClient.timeout = Duration(seconds: 8);
    // httpClient.addResponseModifier((request, response) async {
    //   print(response.body);
    // });
    httpClient.addRequestModifier((Request request) {
      request.headers['Access-Control-Allow-Origin'] = '*';
      return request;
    });

    // httpClient.addAuthenticator((Request request) async {
    //   var token = LocalStorage.getToken();
    //   var headers = {'Authorization': "Bearer $token"};
    //   request.headers.addAll(headers);
    //   return request;
    // });

    super.onInit();
  }

  // Future<Response> login(dynamic body) async {
  //   var response = await post("users/login/", body);
  //   if (response.statusCode == 200) {
  //     // isLoggedIn = true;
  //     await LocalStorage.setLoggedInUser(true);
  //     return response;
  //   } else {
  //     throw "Error Occurred";
  //   }
  // }
}
