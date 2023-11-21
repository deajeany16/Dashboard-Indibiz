import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:webui/helper/services/json_decoder.dart';
// ignore: unused_import
import 'package:webui/models/identifier_model.dart';

class Inputan {
  final String orderid,
      nama,
      namasales,
      kodesales,
      datel,
      sto,
      namaperusahaan,
      alamat,
      koordinat,
      odp,
      nohp,
      nohp2,
      email,
      paket,
      nosc,
      status,
      ketstat,
      ket;
  final DateTime createdAt;

  Inputan(
      this.orderid,
      this.nama,
      this.namasales,
      this.kodesales,
      this.datel,
      this.sto,
      this.namaperusahaan,
      this.alamat,
      this.koordinat,
      this.odp,
      this.nohp,
      this.nohp2,
      this.email,
      this.paket,
      this.nosc,
      this.status,
      this.ketstat,
      this.ket,
      this.createdAt);

  static Inputan fromJSON(Map<String, dynamic> json) {
    JSONDecoder decoder = JSONDecoder(json);

    String orderid = decoder.getString('orderid');
    String nama = decoder.getString('nama');
    String namasales = decoder.getString('namasales');
    String kodesales = decoder.getString('kodesales');
    String datel = decoder.getString('datel');
    String sto = decoder.getString('sto');
    String namaperusahaan = decoder.getString('namaperusahaan');
    String alamat = decoder.getString('alamat');
    String koordinat = decoder.getString('koordinat');
    String odp = decoder.getString('odp');
    String nohp = decoder.getString('no_hp');
    String nohp2 = decoder.getString('no_hp2');
    String email = decoder.getString('email');
    String paket = decoder.getString('paket');
    String nosc = decoder.getString('nosc');
    String status = decoder.getString('status');
    String ketstat = decoder.getString('ketstat');
    String ket = decoder.getString('ket');
    DateTime createdAt = decoder.getDateTime('created_at');

    return Inputan(
        orderid,
        nama,
        namasales,
        kodesales,
        datel,
        sto,
        namaperusahaan,
        alamat,
        koordinat,
        odp,
        nohp,
        nohp2,
        email,
        paket,
        nosc,
        status,
        ketstat,
        ket,
        createdAt);
  }

  static List<Inputan> listFromJSON(List<dynamic> list) {
    return list.map((e) => Inputan.fromJSON(e)).toList();
  }

  //Dummy

  static List<Inputan>? _dummyList;

  static Future<List<Inputan>> get dummyList async {
    if (_dummyList == null) {
      dynamic data = json.decode(await getData());
      _dummyList = listFromJSON(data);
    }

    return _dummyList!;
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('assets/data/inputan.json');
  }
}
