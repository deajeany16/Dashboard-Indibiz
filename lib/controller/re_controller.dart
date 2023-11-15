import 'package:get/get.dart';
import 'package:webui/controller/my_controller.dart';
import 'package:webui/helper/widgets/my_form_validator.dart';
import 'package:webui/models/inputan_data.dart';

class REScreenController extends MyController {
  List<Inputan> re = [];
  MyFormValidator basicValidator = MyFormValidator();

  @override
  void onInit() {
    super.onInit();

    Inputan.dummyList.then((value) {
      re = value;
      update();
    });
  }

  void goToCreateRE() {
    Get.toNamed('/addinputan');
  }
}
