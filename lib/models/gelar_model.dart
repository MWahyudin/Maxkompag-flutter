// To parse this JSON data, do
//
//     final gelar = gelarFromJson(jsonString);

import 'dart:convert';

List<Gelar> gelarFromJson(String str) => List<Gelar>.from(json.decode(str).map((x) => Gelar.fromJson(x)));

String gelarToJson(List<Gelar> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Gelar {
    Gelar({
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

    factory Gelar.fromJson(Map<String, dynamic> json) => Gelar(
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
