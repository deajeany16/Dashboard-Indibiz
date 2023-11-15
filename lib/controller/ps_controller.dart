import 'package:get/get.dart';
import 'package:webui/controller/my_controller.dart';
import 'package:webui/models/inputan_data.dart';

class PSSCreenController extends MyController {
  List<Inputan> ps = [];

  @override
  void onInit() {
    super.onInit();

    Inputan.dummyList.then((value) {
      ps = value;
      update();
    });
  }

  void goToCreatePS() {
    Get.toNamed('/addinputan');
  }
}
