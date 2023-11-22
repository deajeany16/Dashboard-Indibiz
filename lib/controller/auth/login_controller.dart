import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';
import 'package:webui/controller/my_controller.dart';
import 'package:webui/helper/services/auth_service.dart';
import 'package:webui/helper/theme/admin_theme.dart';
import 'package:webui/helper/theme/app_theme.dart';
import 'package:webui/helper/widgets/my_form_validator.dart';
import 'package:webui/helper/widgets/my_validators.dart';
import 'package:webui/helper/utils/ui_mixins.dart';

class LoginController extends MyController {
  MyFormValidator basicValidator = MyFormValidator();
  // List<String> dummyTexts =
  //     List.generate(12, (index) => MyTextUtils.getDummyText(60));
  int selectTime = 1;

  bool showPassword = false, isChecked = false;

  @override
  void onInit() {
    super.onInit();
    basicValidator.addField('username',
        required: true,
        label: "Username",
        // validators: [MyEmailValidator()],
        controller: TextEditingController());

    basicValidator.addField('pass',
        required: true,
        label: "Password",
        validators: [MyLengthValidator(min: 6, max: 10)],
        controller: TextEditingController());
  }

  void select(int select) {
    selectTime = select;
    update();
  }

  void onChangeShowPassword() {
    showPassword = !showPassword;
    update();
  }

  void onChangeCheckBox(bool? value) {
    isChecked = value ?? isChecked;
    update();
  }

  Future<void> onLogin() async {
    try {
      if (basicValidator.validateForm()) {
        update();
        var authService = Get.put(AuthService());
        var login = await authService.login(basicValidator.getData());
        if (login.statusCode == 200) {
          String nextUrl =
              Uri.parse(ModalRoute.of(Get.context!)?.settings.name ?? "")
                      .queryParameters['next'] ??
                  "/dashboard";
          Get.toNamed(
            nextUrl,
          );
        } else {
          basicValidator.addErrors({"username": "Username / Password Salah"});
          basicValidator.addErrors({"pass": "Username / Password Salah"});
          basicValidator.validateForm();
          basicValidator.clearErrors();
        }
      }
    } catch (e) {
      QuickAlert.show(
        context: Get.context!,
        type: QuickAlertType.error,
        text: e.toString(),
      );
      basicValidator.addErrors({"Auth Failed": "failed"});
      basicValidator.validateForm();
      basicValidator.clearErrors();
    }

    update();
  }

  void goToForgotPassword() {
    Get.toNamed('/auth/forgot_password');
  }

  void gotoRegister() {
    Get.offAndToNamed('/auth/sign_up');
  }
}
