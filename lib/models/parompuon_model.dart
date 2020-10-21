// To parse this JSON data, do
//
//     final parompuon = parompuonFromJson(jsonString);

import 'dart:convert';

List<Parompuon> parompuonFromJson(String str) => List<Parompuon>.from(json.decode(str).map((x) => Parompuon.fromJson(x)));

String parompuonToJson(List<Parompuon> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Parompuon {
    Parompuon({
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

    factory Parompuon.fromJson(Map<String, dynamic> json) => Parompuon(
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
