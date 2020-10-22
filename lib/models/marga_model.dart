// To parse this JSON data, do
//
//     final marga = margaFromJson(jsonString);

import 'dart:convert';

// List<Marga> margaFromJson(String str) => List<Marga>.from(json.decode(str).map((x) => Marga.fromJson(x)));

// String margaToJson(List<Marga> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Marga {
  Marga({
    this.id,
    this.nama,
    this.jumlahAnggota,
    this.jumlahVerifikasi,
    this.jumlahKeluarga,
  });

  String id;
  String nama;
  int jumlahAnggota;
  int jumlahVerifikasi;
  int jumlahKeluarga;

  factory Marga.fromJson(Map<String, dynamic> json) {
    return Marga(
      id: json["Id"],
      nama: json["Nama"],
      jumlahAnggota: json["Jumlah_Anggota"],
      jumlahVerifikasi: json["Jumlah_Verifikasi"],
      jumlahKeluarga: json["Jumlah_Keluarga"],
    );
  }

  // Map<String, dynamic> toJson() => {
  //     "Id": id,
  //     "Nama": nama,
  //     "Jumlah_Anggota": jumlahAnggota,
  //     "Jumlah_Verifikasi": jumlahVerifikasi,
  //     "Jumlah_Keluarga": jumlahKeluarga,
  // };
}
