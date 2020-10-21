import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kompag/config/palette.dart';

class SearchMemberScreen extends StatefulWidget {
  final String idMember;
  SearchMemberScreen({Key key, this.idMember}) : super(key: key);

  @override
  _SearchMemberScreenState createState() => _SearchMemberScreenState();
}

class _SearchMemberScreenState extends State<SearchMemberScreen> {
  Future<List> mockStringData;
  Future<Map> member;

  Future<Map> getMember() async {
    Dio dio = new Dio();
    String uri = 'http://apikompag.maxproitsolution.com/api/anggota/cari';
    Response response = await dio.post(
      uri,
      data: {'id_member': widget.idMember},
      options: Options(
          contentType: Headers.formUrlEncodedContentType,
          followRedirects: false,
          validateStatus: (status) {
            return status < 500;
          }),
    );
    // print(response);
    return response.data;
    //  return response.data;
  }

  @override
  void initState() {
    member = getMember();
    // print(member);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // getMember();
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Palette.secondaryColor,
        title: Text('Hasil Pencarian'),
        centerTitle: true,
        leading: InkWell(
          child: Icon(
            Icons.arrow_back,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        // margin: EdgeInsets.only(top: 14, left: 18),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 14, left: 14, right: 14),
              child: Row(
                children: [
                  Text(
                    "ID Member : ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text("${widget.idMember}",
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 18))
                ],
              ),
            ),
            Container(
              // height: screenHeight * 0.7,
              padding: EdgeInsets.only(top: 12, left: 22),
              child: FutureBuilder<Map>(
                future: member,
                builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
                  // print(snapshot.data['message'] != null);
                  if (snapshot.hasData) {
                    if (snapshot.data['message'] == null) {
                       return InkWell(
                          onTap: () {
                            print('hi');
                          },
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Nama : ${snapshot.data['Nama']}",
                              ),
                              Text(
                                "Marga : ${snapshot.data['Marga']}",
                              ),
                              Text(
                                "Parompuon : ${snapshot.data['Parompuon']}",
                              ),
                              Text(
                                "Sektor : ${snapshot.data['Sektor']}",
                              ),
                              Text(
                                "Wilayah : ${snapshot.data['Wilayah']}",
                              ),
                              Text(
                                "No HP : ${snapshot.data['No_HP']}",
                              ),
                              Text(
                                "Email : ${snapshot.data['Email']}",
                              ),
                              Text(
                                "Registrasi : ${snapshot.data['Registrasi']}",
                              ),
                              Text(
                                "Anggota : ",
                              ),
                              Text(
                                  "Nama : ${snapshot.data['Anggota'][0]['Nama']}"),
                              Text(
                                  "Tanggal lahir : ${snapshot.data['Anggota'][0]['Tanggal_lahir']}"),
                              Text(
                                  "No HP : ${snapshot.data['Anggota'][0]['No_HP']}"),
                            ],
                          )
                          
                          );
                    }
                    return Text('ga ada data');
                  } else {
                    return Text('tidak ditemukan');
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
