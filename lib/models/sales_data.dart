// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:webui/helper/services/json_decoder.dart';
import 'package:webui/models/identifier_model.dart';

class Sales extends IdentifierModel {
  final String nama_sales, kode_sales;

  Sales(super.id, this.nama_sales, this.kode_sales);

  static Sales fromJSON(Map<String, dynamic> json) {
    JSONDecoder decoder = JSONDecoder(json);

    String namaSales = decoder.getString('nama_sales');
    String kodeSales = decoder.getString('kode_sales');

    return Sales(decoder.getId, namaSales, kodeSales);
  }

  static List<Sales> listFromJSON(List<dynamic> list) {
    return list.map((e) => Sales.fromJSON(e)).toList();
  }

  static List<Sales>? _dummyList;

  static Future<List<Sales>> get dummyList async {
    if (_dummyList == null) {
      dynamic data = json.decode(await getData());
      _dummyList = listFromJSON(data);
    }
    return _dummyList!.sublist(0, 10);
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('assets/data/sales.json');
  }
}
