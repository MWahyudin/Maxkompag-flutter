// To parse this JSON data, do
//
//     final title = titleFromJson(jsonString);

import 'dart:convert';

List<Title> titleFromJson(String str) => List<Title>.from(json.decode(str).map((x) => Title.fromJson(x)));

String titleToJson(List<Title> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Title {
    Title({
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

    factory Title.fromJson(Map<String, dynamic> json) => Title(
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
