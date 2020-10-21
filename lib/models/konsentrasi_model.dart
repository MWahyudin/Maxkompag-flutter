// To parse this JSON data, do
//
//     final konsentrasi = konsentrasiFromJson(jsonString);

import 'dart:convert';

List<Konsentrasi> konsentrasiFromJson(String str) => List<Konsentrasi>.from(json.decode(str).map((x) => Konsentrasi.fromJson(x)));

String konsentrasiToJson(List<Konsentrasi> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Konsentrasi {
    Konsentrasi({
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

    factory Konsentrasi.fromJson(Map<String, dynamic> json) => Konsentrasi(
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
