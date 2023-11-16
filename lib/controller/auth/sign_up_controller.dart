import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webui/controller/my_controller.dart';
import 'package:webui/helper/services/auth_service.dart';
import 'package:webui/helper/widgets/my_form_validator.dart';
import 'package:webui/helper/widgets/my_validators.dart';

class SignUpController extends MyController {
  MyFormValidator basicValidator = MyFormValidator();
  bool isChecked = false;
  int selectTime = 1;

  void onChangeCheckBox(bool? value) {
    isChecked = value ?? isChecked;
    update();
  }

  void select(int select) {
    selectTime = select;
    update();
  }

  bool showPassword = false, loading = false;

  @override
  void onInit() {
    super.onInit();
    basicValidator.addField(
      'email',
      required: true,
      label: "Email",
      validators: [MyEmailValidator()],
      controller: TextEditingController(),
    );
    basicValidator.addField(
      'name',
      required: true,
      label: 'Name',
      controller: TextEditingController(),
    );
    basicValidator.addField(
      'password',
      required: true,
      validators: [MyLengthValidator(min: 6, max: 10)],
      controller: TextEditingController(),
    );
  }

  // Future<void> onLogin() async {
  //   if (basicValidator.validateForm()) {
  //     loading = true;
  //     update();
  //     var errors = await AuthService.loginUser(basicValidator.getData());
  //     if (errors != null) {
  //       basicValidator.addErrors(errors);
  //       basicValidator.validateForm();
  //       basicValidator.clearErrors();
  //     }
  //     Get.toNamed('/starter');

  //     loading = false;
  //     update();
  //   }
  // }

  Future<void> onLogin() async {
    try {
      if (basicValidator.validateForm()) {
        update();
        var auth = Get.put(AuthService());
        var login = await auth.login(basicValidator.getData());
        if (login.statusCode == 401) {
          basicValidator.addErrors({"Auth Failed": "Gagal"});
          basicValidator.validateForm();
          basicValidator.clearErrors();
        } else {
          String nextUrl =
              Uri.parse(ModalRoute.of(Get.context!)?.settings.name ?? "")
                      .queryParameters['next'] ??
                  "/dashboard";
          Get.toNamed(
            nextUrl,
          );
        }
      }
    } catch (e) {
      basicValidator.addErrors({"Auth Failed": "failed"});
      basicValidator.validateForm();
      basicValidator.clearErrors();
    }

    update();
  }

  void onChangeShowPassword() {
    showPassword = !showPassword;
    update();
  }

  void gotoLogin() {
    Get.toNamed('/auth/login');
  }
}
