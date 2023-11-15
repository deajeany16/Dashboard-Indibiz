import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:webui/helper/services/json_decoder.dart';
import 'package:webui/models/identifier_model.dart';

class User extends IdentifierModel {
  final String nama, username;

  User(super.id, this.nama, this.username);

  static User fromJSON(Map<String, dynamic> json) {
    JSONDecoder decoder = JSONDecoder(json);

    String nama = decoder.getString('nama');
    String username = decoder.getString('username');

    return User(decoder.getId, nama, username);
  }

  static List<User> listFromJSON(List<dynamic> list) {
    return list.map((e) => User.fromJSON(e)).toList();
  }

  static List<User>? _dummyList;

  static Future<List<User>> get dummyList async {
    if (_dummyList == null) {
      dynamic data = json.decode(await getData());
      _dummyList = listFromJSON(data);
    }
    return _dummyList!.sublist(0, 6);
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('assets/data/user.json');
  }
}
