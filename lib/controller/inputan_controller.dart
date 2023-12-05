import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:excel/excel.dart';
import 'package:webui/controller/my_controller.dart';
import 'package:webui/helper/services/order_service.dart';
import 'package:webui/helper/storage/local_storage.dart';
import 'package:webui/helper/widgets/my_form_validator.dart';
import 'package:webui/helper/widgets/my_list_extension.dart';
import 'package:webui/models/inputan_data.dart';
import 'package:webui/widgets/custom_alert.dart';

class InputanController extends MyController {
  MyFormValidator inputValidator = MyFormValidator();
  MyFormValidator editValidator = MyFormValidator();
  GlobalKey<FormFieldState> filterDateKey = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> filterSTOKey = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> filterDatelKey = GlobalKey<FormFieldState>();
  TextEditingController dateController = TextEditingController();
  bool isLoading = true;

  List semuaInputan = [];
  List filteredInputan = [];
  Map<String, dynamic> inputan = {};

  DateTime selectedDate = DateTime.now();
  bool isDatePickerUsed = false;
  String selectedSTO = '';
  String selectedDatel = '';
  List stoList = ['PLK', 'PBU', 'SAI'];
  List datelList = ['Palangka Raya'];

  @override
  void onInit() {
    filteredInputan = _placeholderData();
    getAllOrder();
    super.onInit();
  }

  InputanController() {
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
    editValidator.setControllerText(
        'namaperusahaan', inputan['namaperusahaan']);
    editValidator.setControllerText('alamat', inputan['alamat']);
    editValidator.setControllerText('kodesales', inputan['kodesales']);
    editValidator.setControllerText('odp', inputan['odp']);
    editValidator.setControllerText('koordinat', inputan['koordinat']);
    editValidator.setControllerText('nohp', inputan['nohp']);
    editValidator.setControllerText('nohp2', inputan['nohp2']);
    editValidator.setControllerText('email', inputan['email']);
    editValidator.setControllerText('nosc', inputan['nosc']);
    editValidator.setControllerText('ket', inputan['ket']);
  }

  List<Inputan> _placeholderData() {
    return List.generate(
        6,
        (index) => Inputan(
            '0',
            'nama',
            'nama sales',
            'kode',
            'datel inputan',
            'sto',
            'nama perusahaan inputan',
            'alamat',
            'koordinat',
            'odp',
            'nohp',
            'nohp2',
            'email',
            'paket',
            'nosc',
            'status',
            'ketstat',
            'ket',
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

  Future<void> createExcelFile() async {
    var excel = Excel.createExcel();
    var sheet = excel[excel.getDefaultSheet()!];

    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 0)).value =
        TextCellValue("orderid");
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 0)).value =
        TextCellValue("nama");
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: 0)).value =
        TextCellValue("namasales");
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: 0)).value =
        TextCellValue("kodesales");
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 4, rowIndex: 0)).value =
        TextCellValue("datel");
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 5, rowIndex: 0)).value =
        TextCellValue("sto");
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 6, rowIndex: 0)).value =
        TextCellValue("namaperusahaan");
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 7, rowIndex: 0)).value =
        TextCellValue("alamat");
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 8, rowIndex: 0)).value =
        TextCellValue("odp");
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 9, rowIndex: 0)).value =
        TextCellValue("koordinat");
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 10, rowIndex: 0)).value =
        TextCellValue("nohp");
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 11, rowIndex: 0)).value =
        TextCellValue("nohp2");
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 12, rowIndex: 0)).value =
        TextCellValue("email");
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 13, rowIndex: 0)).value =
        TextCellValue("paket");
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 14, rowIndex: 0)).value =
        TextCellValue("nosc");
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 15, rowIndex: 0)).value =
        TextCellValue("ket");
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 16, rowIndex: 0)).value =
        TextCellValue("status");
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 17, rowIndex: 0)).value =
        TextCellValue("ketstat");
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 18, rowIndex: 0)).value =
        TextCellValue("createdAt");
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 19, rowIndex: 0)).value =
        TextCellValue("updatedAt");

    semuaInputan.mapIndexed((index, item) {
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: index + 1))
          .value = TextCellValue(item.orderid);
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: index + 1))
          .value = TextCellValue(item.nama);
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: index + 1))
          .value = TextCellValue(item.namasales);
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: index + 1))
          .value = TextCellValue(item.kodesales);
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 4, rowIndex: index + 1))
          .value = TextCellValue(item.datel);
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 5, rowIndex: index + 1))
          .value = TextCellValue(item.sto);
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 6, rowIndex: index + 1))
          .value = TextCellValue(item.namaperusahaan);
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 7, rowIndex: index + 1))
          .value = TextCellValue(item.alamat);
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 8, rowIndex: index + 1))
          .value = TextCellValue(item.odp);
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 9, rowIndex: index + 1))
          .value = TextCellValue(item.koordinat);
      sheet
          .cell(
              CellIndex.indexByColumnRow(columnIndex: 10, rowIndex: index + 1))
          .value = TextCellValue(item.nohp);
      sheet
          .cell(
              CellIndex.indexByColumnRow(columnIndex: 11, rowIndex: index + 1))
          .value = TextCellValue(item.nohp2);
      sheet
          .cell(
              CellIndex.indexByColumnRow(columnIndex: 12, rowIndex: index + 1))
          .value = TextCellValue(item.email);
      sheet
          .cell(
              CellIndex.indexByColumnRow(columnIndex: 13, rowIndex: index + 1))
          .value = TextCellValue(item.paket);
      sheet
          .cell(
              CellIndex.indexByColumnRow(columnIndex: 14, rowIndex: index + 1))
          .value = TextCellValue(item.nosc);
      sheet
          .cell(
              CellIndex.indexByColumnRow(columnIndex: 15, rowIndex: index + 1))
          .value = TextCellValue(item.ket);
      sheet
          .cell(
              CellIndex.indexByColumnRow(columnIndex: 16, rowIndex: index + 1))
          .value = TextCellValue(item.status);
      sheet
          .cell(
              CellIndex.indexByColumnRow(columnIndex: 17, rowIndex: index + 1))
          .value = TextCellValue(item.ketstat);
      sheet
              .cell(CellIndex.indexByColumnRow(
                  columnIndex: 18, rowIndex: index + 1))
              .value =
          TextCellValue(DateFormat('dd-MM-yyyy').format(item.createdAt));
    }).toList();

    excel.save(fileName: "inputan.xlsx");
  }

  void onFilter() {
    filteredInputan = semuaInputan;
    if (isDatePickerUsed) {
      onDateFilter();
    }
    if (selectedSTO.isNotEmpty) {
      onSTOFilter();
    }
    if (selectedDatel.isNotEmpty) {
      onDatelFilter();
    }
    update();
  }

  void onDateFilter() {
    filteredInputan = filteredInputan.where((inputan) {
      return (DateFormat('dd-MM-yyyy').format(inputan.createdAt) ==
          DateFormat('dd-MM-yyyy').format(selectedDate));
    }).toList();
  }

  void onSTOFilter() {
    filteredInputan =
        filteredInputan.where((inputan) => inputan.sto == selectedSTO).toList();
  }

  void onDatelFilter() {
    filteredInputan = filteredInputan
        .where((inputan) => inputan.datel == selectedDatel)
        .toList();
  }

  void onResetFilter() {
    isLoading = true;
    filteredInputan = semuaInputan;
    dateController.clear();
    filterSTOKey.currentState?.reset();
    filterDatelKey.currentState?.reset();
    isLoading = false;
    update();
  }

  Future<void> getAllOrder() async {
    try {
      var orderService = Get.put(OrderService());
      String? hakAkses = LocalStorage.getHakAkses();
      late dynamic orders;
      switch (hakAkses) {
        case "admin":
          orders = await orderService.getAllOrderByAdmin();
          break;
        case "inputer":
          orders = await orderService.getAllOrderByInputer();
          break;
        case "sales":
          orders = await orderService.getAllOrderBySales();
          break;
      }
      if (orders.statusCode == 401) {
        LocalStorage.setLoggedInUser(false);
        update();
      } else {
        semuaInputan = Inputan.listFromJSON(orders.body);
        if (semuaInputan.isNotEmpty) {
          stoList = semuaInputan.map((item) => item.sto).toSet().toList();
          datelList = semuaInputan.map((item) => item.datel).toSet().toList();
        }
        filteredInputan = semuaInputan;
      }
    } catch (e) {
      filteredInputan = [];
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
