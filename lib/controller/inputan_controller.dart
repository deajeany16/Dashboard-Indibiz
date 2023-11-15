import 'package:flutter/material.dart';
import 'package:webui/controller/my_controller.dart';
import 'package:webui/helper/widgets/my_form_validator.dart';
import 'package:webui/models/inputan_data.dart';

class InputanController extends MyController {
  List<Inputan> inputan = [];
  MyFormValidator basicValidator = MyFormValidator();

  @override
  void onInit() {
    super.onInit();

    Inputan.dummyList.then((value) {
      inputan = value;
      update();
    });

    basicValidator.addField(
      'salesName',
      label: "Nama Sales",
      required: true,
      controller: TextEditingController(),
    );
    basicValidator.addField(
      'datel',
      label: "datel",
      required: true,
      controller: TextEditingController(),
    );
    basicValidator.addField(
      'sto',
      label: "sto",
      required: true,
      controller: TextEditingController(),
    );
    basicValidator.addField(
      'namaPerusahaan',
      label: "namaPerusahaan",
      required: true,
      controller: TextEditingController(),
    );
    basicValidator.addField(
      'alamatPerusahaan',
      label: "alamatPerusahaan",
      required: true,
      controller: TextEditingController(),
    );
    basicValidator.addField(
      'odp',
      label: "odp",
      required: true,
      controller: TextEditingController(),
    );
    basicValidator.addField(
      'koordinat',
      label: "koordinat",
      required: true,
      controller: TextEditingController(),
    );
    basicValidator.addField(
      'noHp',
      label: "noHp",
      required: true,
      controller: TextEditingController(),
    );
    basicValidator.addField(
      'noHp2',
      label: "noHp2",
      required: true,
      controller: TextEditingController(),
    );
    basicValidator.addField(
      'email',
      label: "email",
      required: true,
      controller: TextEditingController(),
    );
    basicValidator.addField(
      'paket',
      label: "paket",
      required: true,
      controller: TextEditingController(),
    );
    basicValidator.addField(
      'nosc',
      label: "nosc",
      required: true,
      controller: TextEditingController(),
    );
    basicValidator.addField(
      'ketLain',
      label: "ketLain",
      required: true,
      controller: TextEditingController(),
    );
  }
}
