import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:webui/controller/my_controller.dart';
import 'package:webui/helper/services/salesorder_service.dart';
import 'package:webui/helper/storage/local_storage.dart';
import 'package:webui/helper/widgets/my_form_validator.dart';
import 'package:webui/models/salesorder_data.dart';
import 'package:webui/widgets/custom_alert.dart';

class SalesOrderController extends MyController {
  MyFormValidator inputValidator = MyFormValidator();
  MyFormValidator editValidator = MyFormValidator();
  GlobalKey<FormFieldState> filterDateKey = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> filterSTOKey = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> filterDatelKey = GlobalKey<FormFieldState>();
  TextEditingController dateController = TextEditingController();
  bool isLoading = true;

  List semuaSalesOrder = [];
  List filteredSalesOrder = [];
  Map<String, dynamic> salesorderinputan = {};

  DateTime selectedDate = DateTime.now();
  bool isDatePickerUsed = false;
  // String selectedSTO = '';
  // String selectedDatel = '';
  // List stoList = ['PLK', 'PBU', 'SAI'];
  // List datelList = ['Palangka Raya'];

  @override
  void onInit() {
    filteredSalesOrder = _placeholderData();
    getAllSalesOrder();
    super.onInit();
  }

  SalesOrderController() {
    inputValidator.addField(
      'namasaless',
      label: "Nama Sales",
      required: true,
      controller: TextEditingController(),
    );
    inputValidator.addField(
      'kodesaless',
      label: "Kode Sales",
      required: true,
      controller: TextEditingController(),
    );
    inputValidator.addField(
      'namausaha',
      label: "Nama Perusahaan",
      required: true,
      controller: TextEditingController(),
    );
    inputValidator.addField(
      'alamatt',
      label: "Alamat Perusahaan",
      required: false,
      controller: TextEditingController(),
    );
    inputValidator.addField(
      'cp',
      label: "noHp",
      required: false,
      controller: TextEditingController(),
    );
    inputValidator.addField(
      'emaill',
      label: "Email",
      required: false,
      controller: TextEditingController(),
    );
    inputValidator.addField(
      'pakett',
      label: "Paket",
      required: false,
      controller: TextEditingController(),
    );
    inputValidator.addField(
      'maps',
      label: "Link Maps",
      required: false,
      controller: TextEditingController(),
    );
    editValidator.addField(
      'namasaless',
      label: "Nama Sales",
      required: true,
      controller: TextEditingController(text: salesorderinputan['namasaless']),
    );
    editValidator.addField(
      'kodesaless',
      label: "Kode Sales",
      required: true,
      controller: TextEditingController(text: salesorderinputan['kodesaless']),
    );
    editValidator.addField(
      'namausaha',
      label: "Nama Perusahaan",
      required: true,
      controller: TextEditingController(text: salesorderinputan['namausaha']),
    );
    editValidator.addField(
      'alamatt',
      label: "Alamat Perusahaan",
      required: false,
      controller: TextEditingController(text: salesorderinputan['alamatt']),
    );
    editValidator.addField(
      'cp',
      label: "noHp",
      required: false,
      controller: TextEditingController(text: salesorderinputan['cp']),
    );
    editValidator.addField(
      'emaill',
      label: "Email",
      required: false,
      controller: TextEditingController(text: salesorderinputan['emaill']),
    );
    editValidator.addField(
      'pakett',
      label: "Email",
      required: false,
      controller: TextEditingController(text: salesorderinputan['pakett']),
    );
    editValidator.addField(
      'maps',
      label: "Link Maps",
      required: false,
      controller: TextEditingController(text: salesorderinputan['maps']),
    );
  }

  Future<void> onEdit() async {
    editValidator.setControllerText(
        'namasaless', salesorderinputan['namasaless']);
    editValidator.setControllerText(
        'kodesaless', salesorderinputan['kodesaless']);
    editValidator.setControllerText(
        'namausaha', salesorderinputan['namausaha']);
    editValidator.setControllerText('alamatt', salesorderinputan['alamatt']);
    editValidator.setControllerText('cp', salesorderinputan['cp']);
    editValidator.setControllerText('emaill', salesorderinputan['emaill']);
    editValidator.setControllerText('pakett', salesorderinputan['pakett']);
    editValidator.setControllerText('maps', salesorderinputan['maps']);
  }

  List<SalesOrderInputan> _placeholderData() {
    return List.generate(
        10,
        (index) => SalesOrderInputan(
            '0',
            'namasaless',
            'kodesaless',
            'namausaha',
            'alamatt',
            'cp',
            'emaill',
            'pakett',
            'maps',
            DateTime.now()));
  }

  Future<void> selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      dateController.text = DateFormat('dd-MM-yyyy').format(picked);
      isDatePickerUsed = true;
      onFilter();
    }
  }

  void onFilter() {
    filteredSalesOrder = semuaSalesOrder;
    if (isDatePickerUsed) {
      onDateFilter();
    }
    // if (selectedSTO.isNotEmpty) {
    //   onSTOFilter();
    // }
    // if (selectedDatel.isNotEmpty) {
    //   onDatelFilter();
    // }
    update();
  }

  void onDateFilter() {
    filteredSalesOrder = filteredSalesOrder.where((salesorderinputan) {
      return (DateFormat('dd-MM-yyyy').format(salesorderinputan.createdAt) ==
          DateFormat('dd-MM-yyyy').format(selectedDate));
    }).toList();
  }

  // void onSTOFilter() {
  //   filteredSalesOrder =
  //       filteredSalesOrder.where((salesorderinputan) => salesorderinputan.sto == selectedSTO).toList();
  // }

  // void onDatelFilter() {
  //   filteredSalesOrder = filteredSalesOrder
  //       .where((salesorderinputan) => salesorderinputan.datel == selectedDatel)
  //       .toList();
  // }

  void onResetFilter() {
    isLoading = true;
    filteredSalesOrder = semuaSalesOrder;
    dateController.clear();
    filterSTOKey.currentState?.reset();
    filterDatelKey.currentState?.reset();
    isLoading = false;
    update();
  }

  Future<void> getAllSalesOrder() async {
    try {
      var salesorderService = Get.put(SalesOrderService());
      String? hakAkses = LocalStorage.getHakAkses();
      late dynamic salesorders;
      switch (hakAkses) {
        case "admin":
          salesorders = await salesorderService.getAllSalesOrderByAdmin();
          break;
        case "inputer":
          salesorders = await salesorderService.getAllSalesOrderByInputer();
          break;
        case "sales":
          salesorders = await salesorderService.getAllSalesOrderBySales();
          break;
      }
      if (salesorders.statusCode == 401) {
        LocalStorage.setLoggedInUser(false);
        Get.offAllNamed('/auth/login');
        update();
      } else {
        semuaSalesOrder = SalesOrderInputan.listFromJSON(salesorders.body);
        // if (semuaSalesOrder.isNotEmpty) {
        //   stoList = semuaSalesOrder.map((item) => item.sto).toSet().toList();
        //   datelList = semuaSalesOrder.map((item) => item.datel).toSet().toList();
        // }
        filteredSalesOrder = semuaSalesOrder;
      }
    } catch (e) {
      filteredSalesOrder = [];
      Get.dialog(CustomAlert(
        context: Get.context!,
        title: 'Error',
        text: e.toString(),
        confirmBtnText: 'Okay',
      ));
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<void> getSalesOrder(id) async {
    try {
      update();
      var salesorderService = Get.put(SalesOrderService());
      String? hakAkses = LocalStorage.getHakAkses();
      late dynamic salesorder;
      switch (hakAkses) {
        case "admin":
          salesorder = await salesorderService.getSalesOrderByAdmin(id);
          break;
        case "inputer":
          salesorder = await salesorderService.getSalesOrderByInputer(id);
          break;
        case "sales":
          salesorder = await salesorderService.getSalesOrderBySales(id);
          break;
      }
      if (salesorder.statusCode == 401) {
        LocalStorage.setLoggedInUser(false);
        Get.offAllNamed('/auth/login');
        update();
      } else {
        salesorderinputan = salesorder.body;
        // isLoading = false;
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

  Future<void> addSalesOrder() async {
    try {
      if (inputValidator.validateForm()) {
        update();
        var salesorderService = Get.put(SalesOrderService());
        String? hakAkses = LocalStorage.getHakAkses();
        late dynamic salesorder;
        switch (hakAkses) {
          case "admin":
            salesorder = await salesorderService
                .addSalesOrderByAdmin(inputValidator.getData());
            break;
          case "inputer":
            salesorder = await salesorderService
                .addSalesOrderByInputer(inputValidator.getData());
            break;
          case "sales":
            salesorder = await salesorderService
                .addSalesOrderBySales(inputValidator.getData());
            break;
        }
        if (salesorder.statusCode == 200) {
          Get.back();
          Get.dialog(CustomAlert(
            context: Get.context!,
            title: 'Berhasil',
            text: 'Data Berhasil Diinput',
            confirmBtnText: 'Okay',
          ));
          inputValidator.resetForm();
          getAllSalesOrder();
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

  Future<void> editSalesOrder() async {
    try {
      if (editValidator.validateForm()) {
        update();
        var salesorderService = Get.put(SalesOrderService());
        String? hakAkses = LocalStorage.getHakAkses();
        late dynamic salesorder;
        switch (hakAkses) {
          case "admin":
            salesorder = await salesorderService.editSalesOrderByAdmin(
                editValidator.getData(), salesorderinputan['soid']);
            break;
          case "inputer":
            salesorder = await salesorderService.editSalesOrderByInputer(
                editValidator.getData(), salesorderinputan['soid']);
            break;
          case "sales":
            salesorder = await salesorderService.editSalesOrderBySales(
                editValidator.getData(), salesorderinputan['soid']);
            break;
        }
        if (salesorder.statusCode == 200) {
          Get.back();
          Get.dialog(CustomAlert(
            context: Get.context!,
            title: 'Berhasil',
            text: 'Data Berhasil Diedit',
            confirmBtnText: 'Okay',
          ));
          editValidator.resetForm();
          getAllSalesOrder();
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

  Future<void> deleteSalesOrder(id) async {
    try {
      update();
      var salesorderService = Get.put(SalesOrderService());
      String? hakAkses = LocalStorage.getHakAkses();
      late dynamic salesorder;
      switch (hakAkses) {
        case "admin":
          salesorder = await salesorderService.deleteSalesOrderByAdmin(id);
          break;
        case "inputer":
          salesorder = await salesorderService.deleteSalesOrderByInputer(id);
          break;
        case "sales":
          salesorder = await salesorderService.deleteSalesOrderBySales(id);
          break;
      }
      if (salesorder.statusCode == 200) {
        Get.back();
        Get.dialog(CustomAlert(
          context: Get.context!,
          title: 'Berhasil',
          text: 'Data Telah Dihapus',
          confirmBtnText: 'Okay',
        ));
        getAllSalesOrder();
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
