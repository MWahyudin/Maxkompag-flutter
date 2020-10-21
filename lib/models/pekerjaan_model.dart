// To parse this JSON data, do
//
//     final pekerjaan = pekerjaanFromJson(jsonString);

import 'dart:convert';

List<Pekerjaan> pekerjaanFromJson(String str) => List<Pekerjaan>.from(json.decode(str).map((x) => Pekerjaan.fromJson(x)));

String pekerjaanToJson(List<Pekerjaan> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pekerjaan {
    Pekerjaan({
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

    factory Pekerjaan.fromJson(Map<String, dynamic> json) => Pekerjaan(
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
