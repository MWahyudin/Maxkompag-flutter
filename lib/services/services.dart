import 'package:http/http.dart' as http;
import 'package:kompag/models/sektor_model.dart';
import 'dart:convert';

import 'package:kompag/models/wilayah_model.dart';

class Services {
  static const url = 'http://apikompag.maxproitsolution.com/api/statistik/';

  static Future<List<Sektor>> getSektor() async {
    String path = 'sektor';
    try {
      final response = await http.get(url + path);
      print(response.body);
      if (200 == response.statusCode) {
        final List<Sektor> sektor = sektorFromJson(response.body);
        return sektor;
      } else {
        return List<Sektor>();
      }
    } catch (e) {
      return List<Sektor>();
    }
  }
  
  static Future<List<Wilayah>> getWilayah() async {
    String path = 'wilayah';
    try {
      final response = await http.get(url + path);
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
}
