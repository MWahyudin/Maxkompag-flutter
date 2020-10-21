// To parse this JSON data, do
//
//     final pendidikan = pendidikanFromJson(jsonString);

import 'dart:convert';

List<Pendidikan> pendidikanFromJson(String str) => List<Pendidikan>.from(json.decode(str).map((x) => Pendidikan.fromJson(x)));

String pendidikanToJson(List<Pendidikan> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pendidikan {
    Pendidikan({
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

    factory Pendidikan.fromJson(Map<String, dynamic> json) => Pendidikan(
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
