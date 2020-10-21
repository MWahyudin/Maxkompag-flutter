// To parse this JSON data, do
//
//     final sektor = sektorFromJson(jsonString);

import 'dart:convert';

List<Sektor> sektorFromJson(String str) => List<Sektor>.from(json.decode(str).map((x) => Sektor.fromJson(x)));

String sektorToJson(List<Sektor> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Sektor {
    Sektor({
        this.id,
        this.nama,
        this.namaWilayah,
        this.jumlahAnggota,
        this.jumlahVerifikasi,
        this.jumlahKeluarga,
    });

    int id;
    String nama;
    String namaWilayah;
    int jumlahAnggota;
    int jumlahVerifikasi;
    int jumlahKeluarga;

    factory Sektor.fromJson(Map<String, dynamic> json) => Sektor(
        id: json["Id"],
        nama: json["Nama"],
        namaWilayah: json["Nama_Wilayah"],
        jumlahAnggota: json["Jumlah_Anggota"],
        jumlahVerifikasi: json["Jumlah_Verifikasi"],
        jumlahKeluarga: json["Jumlah_Keluarga"],
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "Nama": nama,
        "Nama_Wilayah": namaWilayah,
        "Jumlah_Anggota": jumlahAnggota,
        "Jumlah_Verifikasi": jumlahVerifikasi,
        "Jumlah_Keluarga": jumlahKeluarga,
    };
}

// enum NamaWilayah { BELUM_DILENGKAPI, BEKASI, DEPOK, CIBINONG, JAKARTA_TIMUR_1, JAKARTA_PUSAT }

// final namaWilayahValues = EnumValues({
//     "Bekasi": NamaWilayah.BEKASI,
//     "Belum Dilengkapi": NamaWilayah.BELUM_DILENGKAPI,
//     "Cibinong": NamaWilayah.CIBINONG,
//     "Depok": NamaWilayah.DEPOK,
//     "Jakarta Pusat": NamaWilayah.JAKARTA_PUSAT,
//     "Jakarta Timur 1": NamaWilayah.JAKARTA_TIMUR_1
// });

// class EnumValues<T> {
//     Map<String, T> map;
//     Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         if (reverseMap == null) {
//             reverseMap = map.map((k, v) => new MapEntry(v, k));
//         }
//         return reverseMap;
//     }
// }
