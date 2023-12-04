import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class ApiClient extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = "https://bskaltengapi.xyz/";
    httpClient.defaultContentType = "application/json";
    httpClient.timeout = Duration(seconds: 8);
    httpClient.addRequestModifier((Request request) {
      request.headers['Access-Control-Allow-Origin'] = '*';
      return request;
    });

    super.onInit();
  }
}
