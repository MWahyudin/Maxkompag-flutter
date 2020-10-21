// To parse this JSON data, do
//
//     final keahlian = keahlianFromJson(jsonString);

import 'dart:convert';

List<Keahlian> keahlianFromJson(String str) => List<Keahlian>.from(json.decode(str).map((x) => Keahlian.fromJson(x)));

String keahlianToJson(List<Keahlian> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Keahlian {
    Keahlian({
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

    factory Keahlian.fromJson(Map<String, dynamic> json) => Keahlian(
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
