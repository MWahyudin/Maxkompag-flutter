// To parse this JSON data, do
//
//     final wilayah = wilayahFromJson(jsonString);

import 'dart:convert';

List<Wilayah> wilayahFromJson(String str) => List<Wilayah>.from(json.decode(str).map((x) => Wilayah.fromJson(x)));

String wilayahToJson(List<Wilayah> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Wilayah {
    Wilayah({
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

    factory Wilayah.fromJson(Map<String, dynamic> json) => Wilayah(
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
