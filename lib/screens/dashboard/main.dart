import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kompag/config/palette.dart';
import 'package:kompag/data/data.dart';
import 'package:kompag/screens/dashboard/member/main.dart';
import 'package:kompag/screens/dashboard/statistik/gelar_statistik.dart';
import 'package:kompag/screens/dashboard/statistik/generasi_statistik.dart';
import 'package:kompag/screens/dashboard/statistik/keahlian_statistik.dart';
import 'package:kompag/screens/dashboard/statistik/konsentrasi_statistik.dart';
import 'package:kompag/screens/dashboard/statistik/marga_statistik.dart';
import 'package:kompag/screens/dashboard/statistik/parompuon_statistik.dart';
import 'package:kompag/screens/dashboard/statistik/pekerjaan_statistik.dart';
import 'package:kompag/screens/dashboard/statistik/pendidikan_statistik.dart';
import 'package:kompag/screens/dashboard/statistik/sektor_statistik.dart';
import 'package:kompag/screens/dashboard/statistik/source_statistik.dart';
import 'package:kompag/screens/dashboard/statistik/title_statistik.dart';
import 'package:kompag/screens/dashboard/statistik/wilayah_statistik.dart';
import 'package:kompag/screens/dashboard/wilayah/wilayah_list_screen.dart';
import 'package:kompag/widgets/custom_app_bar.dart';
import 'dart:convert';

import 'package:page_transition/page_transition.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List data;
  List dataWilayah = [
    {'1': '2'}
  ];
  Future getWilayah() async {
    String uri = 'http://apikompag.maxproitsolution.com/api/statistik/wilayah';
    Response response = await Dio().get(uri);
    // print(response.data);
    // print('hiho');
    data = response.data;
    setState(() {
      dataWilayah = data;
    });
    // print(dataWilayah.toString());
  }

  @override
  void initState() {
    super.initState();
    getWilayah();
    // getWilayah();
    // dataWilayah = getWilayah();
    // print(dataWilayah);
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: CustomScrollView(
        //  physics: new NeverScrollableScrollPhysics(),
        physics: new ClampingScrollPhysics(),
        slivers: <Widget>[
          _buildMenuGrid(screenHeight, screenWidth, context),
          _buildTipsSection(screenHeight, context),
          _buildListWilayah(screenHeight),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                margin:
                    EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 10),
                width: 400.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  border: Border.all(color: Colors.black),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          dataWilayah != null
                              ? Text(
                                  '${dataWilayah[index]['Nama']}',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                )
                              : Text(''),
                        ],
                      ),
                      dataWilayah != null
                          ? Wrap(
                              runSpacing: -8.0,
                              spacing: 8.0,
                              children: <Widget>[
                                DetailWilayah(Icons.person,
                                    'Anggota ${dataWilayah[index]['Jumlah_Anggota']}'),
                                DetailWilayah(Icons.verified,
                                    'Terverifikasi ${dataWilayah[index]['Jumlah_Verifikasi']}'),
                                DetailWilayah(Icons.family_restroom,
                                    'Keluarga ${dataWilayah[index]['Jumlah_Keluarga']}'),
                              ],
                            )
                          : Text("Loading..."),
                    ],
                  ),
                ),
              );
            }, childCount: dataWilayah.length),
          )

          // SliverList(
          //   delegate: SliverChildListDelegate(
          // [
          //   Container(
          //     child: FutureBuilder<List>(
          //       future: dataWilayah,
          //       builder:
          //           (BuildContext context, AsyncSnapshot<List> snapshot) {
          //         if (snapshot.hasData) {
          //           print(snapshot.data);
          //           return ListView.builder(
          //             itemBuilder: (BuildContext context, int index) {
          //               return Expanded(
          //                   child: Column(
          //                 children: [
          //                   Text('hello')
          //                 ],
          //               ));
          //             },
          //           );
          //         }
          //         return Text('ga ada');
          //       },
          //     ),
          //   )
          // ],
          //   ),
          // )
          // _buildListWilayahDio(screenHeight)
        ],
      ),
    );
  }
}

SliverToBoxAdapter _buildTipsSection(double screenHeight, context) {
  return SliverToBoxAdapter(
    child: Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      // color: Colors.orange,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Statistik',
            style: const TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              // padding: EdgeInsets.fromLTRB(10.0, 0.0, 15.0, 0.0),
              child: Container(
                // padding: EdgeInsets.only(right: 20),
                // padding: EdgeInsets.all(30),
                // margin: EdgeInsets.all(4),
                child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: postTips
                        .map(
                          (e) => Container(
                            padding: EdgeInsets.only(right: 15),
                            child: InkWell(
                              onTap: () {
                                if (e['link'] == 'WilayahScreen()') {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                      duration: Duration(milliseconds: 200),
                                      type: PageTransitionType
                                          .rightToLeftWithFade,
                                      child: WilayahStatistikScreen(),
                                    ),
                                  );
                                } else if (e['link'] == 'SektorScreen()') {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          duration: Duration(milliseconds: 200),
                                          type: PageTransitionType
                                              .rightToLeftWithFade,
                                          child: SektorStatistikScreen()));
                                } else if (e['link'] == 'MargaScreen()') {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          duration: Duration(milliseconds: 200),
                                          type: PageTransitionType
                                              .rightToLeftWithFade,
                                          child: MargaStatistikScreen()));
                                } else if (e['link'] == 'GenerasiScreen()') {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          duration: Duration(milliseconds: 200),
                                          type: PageTransitionType
                                              .rightToLeftWithFade,
                                          child: GenerasiStatistikScreen()));
                                } else if (e['link'] == 'ParompuonScreen()') {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          duration: Duration(milliseconds: 200),
                                          type: PageTransitionType
                                              .rightToLeftWithFade,
                                          child: ParompuonStatistikScreen()));
                                } else if (e['link'] == 'GelarScreen()') {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          duration: Duration(milliseconds: 200),
                                          type: PageTransitionType
                                              .rightToLeftWithFade,
                                          child: GelarStatistikScreen()));
                                } else if (e['link'] == 'TitleScreen()') {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          duration: Duration(milliseconds: 200),
                                          type: PageTransitionType
                                              .rightToLeftWithFade,
                                          child: TitleStatistikScreen()));
                                } else if (e['link'] == 'KeahlianScreen()') {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          duration: Duration(milliseconds: 200),
                                          type: PageTransitionType
                                              .rightToLeftWithFade,
                                          child: KeahlianStatistikScreen()));
                                } else if (e['link'] == 'KonsentrasiScreen()') {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          duration: Duration(milliseconds: 200),
                                          type: PageTransitionType
                                              .rightToLeftWithFade,
                                          child: KonsentrasiStatistikScreen()));
                                } else if (e['link'] == 'PekerjaanScreen()') {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          duration: Duration(milliseconds: 200),
                                          type: PageTransitionType
                                              .rightToLeftWithFade,
                                          child: PekerjaanStatistikScreen()));
                                } else if (e['link'] == 'PendidikanScreen()') {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          duration: Duration(milliseconds: 200),
                                          type: PageTransitionType
                                              .rightToLeftWithFade,
                                          child: PendidikanStatistikScreen()));
                                } else if (e['link'] == 'SourceScreen()') {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          duration: Duration(milliseconds: 200),
                                          type: PageTransitionType
                                              .rightToLeftWithFade,
                                          child: SourceStatistikScreen()));
                                } else {}
                                // Navigator.push(context,PageTransition(duration: Duration(milliseconds: 200),type: PageTransitionType.rightToLeftWithFade,child: WilayahListScreen()));
                              },
                              child: Column(
                                children: <Widget>[
                                  Image.asset(
                                    e.keys.first,
                                    height: screenHeight * 0.12,
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.015,
                                  ),
                                  Text(
                                    e.values.first,
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList()),
              )),
        ],
      ),
    ),
  );
}

SliverToBoxAdapter _buildListWilayah(double screenHeight) {
  return SliverToBoxAdapter(
      child: Padding(
    padding: EdgeInsets.only(
      left: 16,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 9.0, vertical: 13),
          child: Text(
            'Data Wilayah',
            style: const TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    ),
  ));
}

class DetailWilayah extends StatelessWidget {
  final IconData iconData;
  final String label;

  const DetailWilayah(this.iconData, this.label);

  @override
  Widget build(BuildContext context) {
    return RawChip(
      label: Text(label),
      labelStyle: TextStyle(color: Colors.black, fontSize: 16),
      backgroundColor: Colors.white,
      avatar: Icon(iconData),
    );
  }
}

SliverToBoxAdapter _buildMenuGrid(
    double screenHeight, double screenWidth, context) {
  return SliverToBoxAdapter(
    child: Container(
      height: screenHeight * 0.3,
      // width: screenWidth * 2,
      padding: EdgeInsets.only(right: 30, left: 30),
      child: GridView.count(
        childAspectRatio: MediaQuery.of(context).size.height / 840,
        crossAxisCount: 4,

        physics: NeverScrollableScrollPhysics(),
        // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //  childAspectRatio: _aspectRatio,
        // childAspectRatio: 1,
        // ),
        children: <Widget>[
          _gridItemMenu(
            Icons.person,
            'member',
            context,
            menu: 'Members',
          ),
          _gridItemMenu(
            Icons.ac_unit,
            '2',
            context,
          ),
          _gridItemMenu(
            Icons.list,
            '2',
            context,
          ),
          _gridItemMenu(
            Icons.bar_chart,
            '2',
            context,
          ),
          _gridItemMenu(
            Icons.mail,
            '2',
            context,
          ),
          _gridItemMenu(
            Icons.phone,
            '2',
            context,
          ),
          _gridItemMenu(
            Icons.pages,
            '2',
            context,
          ),
          _gridItemMenu(
            Icons.airplanemode_on,
            '2',
            context,
          ),
        ],
      ),
    ),
  );
}

_gridItemMenu(icon, link, context, {menu = 'default'}) {
  return Column(
    children: <Widget>[
      InkWell(
        onTap: () {
          link == 'member'
              ? Navigator.push(
                  context,
                  PageTransition(
                      duration: Duration(milliseconds: 300),
                      type: PageTransitionType.leftToRightWithFade,
                      child: MemberScreen()))
              : print('hello');
        },
        child: CircleAvatar(
          minRadius: 20.0,
          maxRadius: 35.0,
          child: Icon(
            icon,
            size: 40.0,
            color: Colors.white,
          ),
          backgroundColor: Palette.secondaryColor,
        ),
      ),
      SizedBox(
        height: 10.0,
      ),
      Text(menu)
      // menu != 2 ? Text('hi') : Text('belum diatur')
    ],
  );
}
