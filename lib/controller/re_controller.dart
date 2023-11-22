import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webui/controller/my_controller.dart';
import 'package:webui/helper/services/order_service.dart';
import 'package:webui/helper/storage/local_storage.dart';
import 'package:webui/helper/widgets/my_form_validator.dart';
import 'package:webui/models/inputan_data.dart';
import 'package:webui/widgets/custom_alert.dart';

class REScreenController extends MyController {
  bool isLoading = false;
  List re = [];
  Map<String, dynamic> inputan = {};
  MyFormValidator inputValidator = MyFormValidator();
  MyFormValidator editValidator = MyFormValidator();

  @override
  void onInit() {
    super.onInit();
    getAllOrder();
  }

  REScreenController() {
    inputValidator.addField(
      'nama',
      label: "Nama Inputer",
      required: true,
      controller: TextEditingController(),
    );
    inputValidator.addField(
      'namasales',
      label: "Nama Sales",
      required: true,
      controller: TextEditingController(),
    );
    inputValidator.addField(
      'kodesales',
      label: "Kode Sales",
      required: true,
      controller: TextEditingController(),
    );
    inputValidator.addField(
      'datel',
      label: "datel",
      required: false,
      controller: TextEditingController(),
    );
    inputValidator.addField(
      'sto',
      label: "sto",
      required: false,
      controller: TextEditingController(),
    );
    inputValidator.addField(
      'namaperusahaan',
      label: "Nama Perusahaan",
      required: true,
      controller: TextEditingController(),
    );
    inputValidator.addField(
      'alamat',
      label: "alamatPerusahaan",
      required: false,
      controller: TextEditingController(),
    );
    inputValidator.addField(
      'odp',
      label: "odp",
      required: false,
      controller: TextEditingController(),
    );
    inputValidator.addField(
      'koordinat',
      label: "koordinat",
      required: false,
      controller: TextEditingController(),
    );
    inputValidator.addField(
      'nohp',
      label: "noHp",
      required: false,
      controller: TextEditingController(),
    );
    inputValidator.addField(
      'nohp2',
      label: "noHp2",
      required: false,
      controller: TextEditingController(),
    );
    inputValidator.addField(
      'email',
      label: "email",
      required: false,
      controller: TextEditingController(),
    );
    inputValidator.addField(
      'paket',
      label: "paket",
      required: true,
      controller: TextEditingController(),
    );
    inputValidator.addField(
      'nosc',
      label: "nosc",
      required: true,
      controller: TextEditingController(),
    );
    inputValidator.addField(
      'ket',
      label: "Keterangan Lain",
      required: false,
      controller: TextEditingController(),
    );
    editValidator.addField(
      'nama',
      label: "Nama Inputer",
      required: true,
      controller: TextEditingController(text: inputan['nama']),
    );
    editValidator.addField(
      'namasales',
      label: "Nama Sales",
      required: true,
      controller: TextEditingController(text: inputan['namasales']),
    );
    editValidator.addField(
      'kodesales',
      label: "Kode Sales",
      required: true,
      controller: TextEditingController(text: inputan['kodesales']),
    );
    editValidator.addField(
      'datel',
      label: "datel",
      required: false,
      controller: TextEditingController(text: inputan['datel']),
    );
    editValidator.addField(
      'sto',
      label: "sto",
      required: false,
      controller: TextEditingController(text: inputan['sto']),
    );
    editValidator.addField(
      'namaperusahaan',
      label: "Nama Perusahaan",
      required: true,
      controller: TextEditingController(text: inputan['namaperusahaan']),
    );
    editValidator.addField(
      'alamat',
      label: "alamatPerusahaan",
      required: false,
      controller: TextEditingController(text: inputan['alamat']),
    );
    editValidator.addField(
      'odp',
      label: "odp",
      required: false,
      controller: TextEditingController(text: inputan['odp']),
    );
    editValidator.addField(
      'koordinat',
      label: "koordinat",
      required: false,
      controller: TextEditingController(text: inputan['koordinat']),
    );
    editValidator.addField(
      'nohp',
      label: "noHp",
      required: false,
      controller: TextEditingController(text: inputan['nohp']),
    );
    editValidator.addField(
      'nohp2',
      label: "noHp2",
      required: false,
      controller: TextEditingController(text: inputan['nohp2']),
    );
    editValidator.addField(
      'email',
      label: "email",
      required: false,
      controller: TextEditingController(text: inputan['email']),
    );
    editValidator.addField(
      'paket',
      label: "paket",
      required: true,
      controller: TextEditingController(text: inputan['paket']),
    );
    editValidator.addField(
      'nosc',
      label: "nosc",
      required: true,
      controller: TextEditingController(text: inputan['nosc']),
    );
    editValidator.addField(
      'ket',
      label: "Keterangan Lain",
      required: false,
      controller: TextEditingController(text: inputan['ket']),
    );
  }

  Future<void> onEdit() async {
    editValidator.setControllerText('nama', inputan['nama']);
    editValidator.setControllerText('namasales', inputan['namasales']);
    editValidator.setControllerText('kodesales', inputan['kodesales']);
    editValidator.setControllerText('datel', inputan['datel']);
    editValidator.setControllerText('sto', inputan['sto']);
    editValidator.setControllerText(
        'namaperusahaan', inputan['namaperusahaan']);
    editValidator.setControllerText('alamat', inputan['alamat']);
    editValidator.setControllerText('kodesales', inputan['kodesales']);
    editValidator.setControllerText('odp', inputan['odp']);
    editValidator.setControllerText('koordinat', inputan['koordinat']);
    editValidator.setControllerText('nohp', inputan['nohp']);
    editValidator.setControllerText('nohp2', inputan['nohp2']);
    editValidator.setControllerText('email', inputan['email']);
    editValidator.setControllerText('paket', inputan['paket']);
    editValidator.setControllerText('nosc', inputan['nosc']);
    editValidator.setControllerText('ket', inputan['ket']);
  }

  Future<void> getAllOrder() async {
    try {
      update();
      var orderService = Get.put(OrderService());
      String? hakAkses = LocalStorage.getHakAkses();
      late dynamic orders;
      switch (hakAkses) {
        case "admin":
          orders = await orderService.getREOrderByAdmin();
          break;
        case "inputer":
          orders = await orderService.getREOrderByInputer();
          break;
        case "sales":
          orders = await orderService.getREOrderBySales();
          break;
      }
      if (orders.statusCode == 401) {
        LocalStorage.setLoggedInUser(false);
        update();
      } else {
        re = Inputan.listFromJSON(orders.body);
        update();
      }
    } catch (e) {
      Get.dialog(CustomAlert(
        context: Get.context!,
        title: 'Error',
        text: e.toString(),
        confirmBtnText: 'Okay',
      ));
    }
  }

  Future<void> getOrder(id) async {
    try {
      update();
      var orderService = Get.put(OrderService());
      String? hakAkses = LocalStorage.getHakAkses();
      late dynamic order;
      switch (hakAkses) {
        case "admin":
          order = await orderService.getOrderByAdmin(id);
          break;
        case "inputer":
          order = await orderService.getOrderByInputer(id);
          break;
        case "sales":
          order = await orderService.getOrderBySales(id);
          break;
      }
      if (order.statusCode == 401) {
        LocalStorage.setLoggedInUser(false);
        update();
      } else {
        inputan = order.body;
        isLoading = false;
        update();
      }
    } catch (e) {
      Get.dialog(CustomAlert(
        context: Get.context!,
        title: 'Error',
        text: e.toString(),
        confirmBtnText: 'Okay',
      ));
    }
  }

  Future<void> addOrder() async {
    try {
      if (inputValidator.validateForm()) {
        update();
        var orderService = Get.put(OrderService());
        String? hakAkses = LocalStorage.getHakAkses();
        late dynamic order;
        switch (hakAkses) {
          case "admin":
            order =
                await orderService.addOrderByAdmin(inputValidator.getData());
            break;
          case "inputer":
            order =
                await orderService.addOrderByInputer(inputValidator.getData());
            break;
        }
        if (order.statusCode == 200) {
          Get.back();
          Get.dialog(CustomAlert(
            context: Get.context!,
            title: 'Berhasil',
            text: 'Data Berhasil Diinput',
            confirmBtnText: 'Okay',
          ));
          inputValidator.resetForm();
          getAllOrder();
        }
      }
    } catch (e) {
      Get.dialog(CustomAlert(
        context: Get.context!,
        title: 'Error',
        text: e.toString(),
        confirmBtnText: 'Okay',
      ));
    }

    update();
  }

  Future<void> editOrder() async {
    try {
      if (editValidator.validateForm()) {
        update();
        var orderService = Get.put(OrderService());
        String? hakAkses = LocalStorage.getHakAkses();
        late dynamic order;
        switch (hakAkses) {
          case "admin":
            order = await orderService.editOrderByAdmin(
                editValidator.getData(), inputan['orderid']);
            break;
          case "inputer":
            order = await orderService.editOrderByInputer(
                editValidator.getData(), inputan['orderid']);
            break;
        }
        if (order.statusCode == 200) {
          Get.back();
          Get.dialog(CustomAlert(
            context: Get.context!,
            title: 'Berhasil',
            text: 'Data Berhasil Diedit',
            confirmBtnText: 'Okay',
          ));
          editValidator.resetForm();
          getAllOrder();
        }
      }
    } catch (e) {
      Get.dialog(CustomAlert(
        context: Get.context!,
        title: 'Error',
        text: e.toString(),
        confirmBtnText: 'Okay',
      ));
    }

    update();
  }

  Future<void> deleteOrder(id) async {
    try {
      update();
      var orderService = Get.put(OrderService());
      String? hakAkses = LocalStorage.getHakAkses();
      late dynamic order;
      switch (hakAkses) {
        case "admin":
          order = await orderService.deleteOrderByAdmin(id);
          break;
        case "inputer":
          order = await orderService.deleteOrderByInputer(id);
          break;
      }
      if (order.statusCode == 200) {
        Get.back();
        Get.dialog(CustomAlert(
          context: Get.context!,
          title: 'Berhasil',
          text: 'Data Telah Dihapus',
          confirmBtnText: 'Okay',
        ));
        getAllOrder();
      }
    } catch (e) {
      Get.dialog(CustomAlert(
        context: Get.context!,
        title: 'Error',
        text: e.toString(),
        confirmBtnText: 'Okay',
      ));
    }

    update();
  }
}
