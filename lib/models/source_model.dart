// To parse this JSON data, do
//
//     final source = sourceFromJson(jsonString);

import 'dart:convert';

List<Source> sourceFromJson(String str) =>
    List<Source>.from(json.decode(str).map((x) => Source.fromJson(x)));

String sourceToJson(List<Source> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Source {
  Source({
    this.id,
    this.nama,
    this.jumlahAnggota,
    this.jumlahVerifikasi,
    this.jumlahKeluarga,
  });

  int id;
  String nama;
  int jumlahAnggota;
  int jumlahVerifikasi;
  int jumlahKeluarga;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["Id"],
        nama: json["Nama"],
        jumlahAnggota: json["Jumlah_Anggota"],
        jumlahVerifikasi: json["Jumlah_Verifikasi"],
        jumlahKeluarga: json["Jumlah_Keluarga"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Nama": nama,
        "Jumlah_Anggota": jumlahAnggota,
        "Jumlah_Verifikasi": jumlahVerifikasi,
        "Jumlah_Keluarga": jumlahKeluarga,
      };
}
