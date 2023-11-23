import 'package:webui/controller/my_controller.dart';
import 'package:webui/helper/services/auth_service.dart';
import 'package:webui/helper/storage/local_storage.dart';
import 'package:get/get.dart';
import 'package:webui/models/user_data.dart';

class UserController extends MyController {
  List<User> semuaUser = [];

  // MyFormValidator basicValidator = MyFormValidator();
  bool loading = false;

  @override
  void onInit() {
    super.onInit();
    getAllUser();
  }

  Future<void> getAllUser() async {
    try {
      update();
      var authService = Get.put(AuthService());
      String? hakAkses = LocalStorage.getHakAkses();
      late dynamic users;
      switch (hakAkses) {
        case "admin":
          users = await authService.getAllUsersByAdmin();
          break;
        case "inputer":
          users = await authService.getAllUsersByInputer();
          break;
        case "sales":
          users = await authService.getAllUsersBySales();
          break;
      }
      if (users.statusCode == 401) {
        LocalStorage.setLoggedInUser(false);
      } else {
        semuaUser = User.listFromJSON(users.body);
        update();
      }
    } catch (e) {
      //   Get.defaultDialog(
      //       title: "Error",
      //       middleText: "Unexpected error",
      //       backgroundColor: Colors.teal,
      //       titleStyle: TextStyle(color: Colors.white),
      //       middleTextStyle: TextStyle(color: Colors.white),
      //       radius: 30);
    }
  }
}
