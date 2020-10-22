import 'package:http/http.dart' as http;
import 'package:kompag/models/marga_model.dart';
import 'package:kompag/models/sektor_model.dart';
import 'dart:convert';

import 'package:kompag/models/wilayah_model.dart';

class Services {
  // static const url = 'http://apikompag.maxproitsolution.com/api/statistik/';

  static Future<List<Sektor>> getSektor() async {
    // String path = 'sektor';
    final response = await http
        .get('http://apikompag.maxproitsolution.com/api/statistik/sektor');

    // print(response.body);
    if (response.statusCode == 200) {
      final _data =
          json.decode(response.body)['data'].cast<Map<String, dynamic>>();
      List<Sektor> _list =
          _data.map<Sektor>((json) => Sektor.fromJson(json)).toList();
      // _list = _list.getRange(0, 8).toList();

      _list = _list.reversed.toList();
      return _list.reversed.toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<List<Wilayah>> getWilayah() async {
    // String path = 'wilayah';
    try {
      final response = await http
          .get('http://apikompag.maxproitsolution.com/api/statistik/wilayah');
      print(response.body);
      if (200 == response.statusCode) {
        final List<Wilayah> wilayah = wilayahFromJson(response.body);
        return wilayah;
      } else {
        return List<Wilayah>();
      }
    } catch (e) {
      return List<Wilayah>();
    }
  }

  static Future<List<Marga>> getMarga() async {
    final response = await http
        .get('http://apikompag.maxproitsolution.com/api/statistik/marga');

    if (response.statusCode == 200) {
      final _data =
          json.decode(response.body)['data'].cast<Map<String, dynamic>>();
      List<Marga> _list =
          _data.map<Marga>((json) => Marga.fromJson(json)).toList();
      // _list = _list.getRange(0, 8).toList();

      _list = _list.reversed.toList();
      return _list.reversed.toList();

      // final List<Marga> marga = margaFromJson(response.body);
      // return marga;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
