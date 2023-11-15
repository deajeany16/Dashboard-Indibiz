import 'package:get/get.dart';
import 'package:webui/controller/my_controller.dart';
import 'package:webui/models/inputan_data.dart';

class PIScreenController extends MyController {
  List<Inputan> pi = [];

  @override
  void onInit() {
    super.onInit();

    Inputan.dummyList.then((value) {
      pi = value;
      update();
    });
  }

  void goToCreatePI() {
    Get.toNamed('/addinputan');
  }
}
