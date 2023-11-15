import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:webui/helper/services/json_decoder.dart';
import 'package:webui/models/identifier_model.dart';

class Inputan extends IdentifierModel {
  final String user,
      nama,
      namasales,
      kodesales,
      datel,
      sto,
      namaperusahaan,
      alamatperusahaan,
      koordinat,
      odp,
      noHp,
      noHp2,
      email,
      paket,
      nosc,
      status,
      ketstatus,
      ketlain;
  final DateTime createdAt;

  Inputan(
      super.id,
      this.user,
      this.nama,
      this.namasales,
      this.kodesales,
      this.datel,
      this.sto,
      this.namaperusahaan,
      this.alamatperusahaan,
      this.koordinat,
      this.odp,
      this.noHp,
      this.noHp2,
      this.email,
      this.paket,
      this.nosc,
      this.status,
      this.ketstatus,
      this.ketlain,
      this.createdAt);

  static Inputan fromJSON(Map<String, dynamic> json) {
    JSONDecoder decoder = JSONDecoder(json);

    String user = decoder.getString('user');
    String nama = decoder.getString('nama');
    String namasales = decoder.getString('namasales');
    String kodesales = decoder.getString('kodesales');
    String datel = decoder.getString('datel');
    String sto = decoder.getString('sto');
    String namaperusahaan = decoder.getString('namaperusahaan');
    String alamatperusahaan = decoder.getString('alamatperusahaan');
    String koordinat = decoder.getString('koordinat');
    String odp = decoder.getString('odp');
    String noHp = decoder.getString('no_hp');
    String noHp2 = decoder.getString('no_hp2');
    String email = decoder.getString('email');
    String paket = decoder.getString('paket');
    String nosc = decoder.getString('nosc');
    String status = decoder.getString('status');
    String ketStatus = decoder.getString('ket_status');
    String ketLain = decoder.getString('ket_lain');
    DateTime createdAt = decoder.getDateTime('created_at');

    return Inputan(
        decoder.getId,
        user,
        nama,
        namasales,
        kodesales,
        datel,
        sto,
        namaperusahaan,
        alamatperusahaan,
        koordinat,
        odp,
        noHp,
        noHp2,
        email,
        paket,
        nosc,
        status,
        ketStatus,
        ketLain,
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
