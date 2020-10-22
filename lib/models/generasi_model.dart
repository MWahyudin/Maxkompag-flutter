// To parse this JSON data, do
//
//     final generasi = generasiFromJson(jsonString);

import 'dart:convert';

// List<Generasi> generasiFromJson(String str) => List<Generasi>.from(json.decode(str).map((x) => Generasi.fromJson(x)));

// String generasiToJson(List<Generasi> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Generasi {
  Generasi({
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

  factory Generasi.fromJson(Map<String, dynamic> json) => Generasi(
        id: json["id"],
        nama: json["nama"],
        jumlahAnggota: json["jumlah_anggota"],
        jumlahVerifikasi: json["jumlah_verifikasi"],
        jumlahKeluarga: json["jumlah_keluarga"],
      );

  // Map<String, dynamic> toJson() => {
  //     "Id": id,
  //     "Nama": nama,
  //     "Jumlah_Anggota": jumlahAnggota,
  //     "Jumlah_Verifikasi": jumlahVerifikasi,
  //     "Jumlah_Keluarga": jumlahKeluarga,
  // };
}
