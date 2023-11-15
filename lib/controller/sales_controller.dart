import 'package:webui/controller/my_controller.dart';
import 'package:webui/helper/widgets/my_form_validator.dart';
import 'package:webui/models/sales_data.dart';

class SalesController extends MyController {
  List<Sales> sales = [];

  MyFormValidator basicValidator = MyFormValidator();
  bool loading = false;

  @override
  void onInit() {
    super.onInit();

    Sales.dummyList.then((value) {
      sales = value.sublist(0, 7);
      update();
    });
  }
}
