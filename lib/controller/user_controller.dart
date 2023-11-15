import 'package:webui/controller/my_controller.dart';
import 'package:webui/helper/widgets/my_form_validator.dart';
import 'package:webui/models/user_data.dart';

class UserController extends MyController {
  List<User> user = [];

  MyFormValidator basicValidator = MyFormValidator();
  bool loading = false;

  @override
  void onInit() {
    super.onInit();

    User.dummyList.then((value) {
      user = value.sublist(0, 6);
      update();
    });
  }
}
