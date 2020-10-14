import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kompag/config/palette.dart';
import 'package:kompag/data/data.dart';
import 'package:kompag/widgets/custom_app_bar.dart';
import 'dart:convert';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          _buildMenuGrid(screenHeight),
          _buildTipsSection(screenHeight),
          // _buildListWilayah(screenHeight),
          _buildListWilayah(screenHeight),
          WilayahCards(
            screenHeight: 1,
          ),
        ],
      ),
    );
  }
}

// SliverToBoxAdapter _buildListWilayah(double screenHeight) {
//   return SliverToBoxAdapter(
//     child: Container(),
//   );
// }

SliverToBoxAdapter _buildTipsSection(double screenHeight) {
  return SliverToBoxAdapter(
    child: Container(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
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
                                print(e['link']);
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
        // SizedBox(height: screenHeight*0.1),
        // WilayahCards(),
        // WilayahCards(),
      ],
    ),
  ));
}

class WilayahCards extends StatefulWidget {
  final screenHeight;
  const WilayahCards({Key key, this.screenHeight}) : super(key: key);

  @override
  _WilayahCardsState createState() => _WilayahCardsState();
}

class _WilayahCardsState extends State<WilayahCards> {
  Map data;
  List dataWilayah;
  // Map wilayahs;
  Future getWilayah() async {
    String uri =
        'http://apikompag.maxproitsolution.com/api/statistik/WilayahResource';
    Response response = await Dio().get(uri);
    // print(response.data);
    print('hiho');
    data = response.data;
    setState(() {
      dataWilayah = data['data'];
    });
    // print(dataWilayah.toString());
  }

  @override
  void initState() {
    // wilayahs = getWilayah();
    super.initState();
    getWilayah();
  }

  // getData() async {
  //   List data = await getWilayah();
  //   String myData = data[0]['data'];
  //   return myData;
  // }

  @override
  Widget build(BuildContext context) {
    // print(dataWilayah);
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Container(
          margin: EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 10),
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
                    Text(
                      '${dataWilayah[index]['nama']}',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                  Wrap(
                      runSpacing: -8.0,
                      spacing: 8.0,
                      children: <Widget>[
                        DetailWilayah(Icons.person, 'Anggota ${dataWilayah[index]['jumlah_anggota']}'),
                        DetailWilayah(Icons.verified, 'Terverifikasi ${dataWilayah[index]['jumlah_verifikasi']}'),
                        DetailWilayah(Icons.family_restroom, 'Keluarga ${dataWilayah[index]['jumlah_keluarga']}'),
                      ],
                    ),
              ],
            ),
          ),
        );
      }, childCount: dataWilayah.length),
    );
  }
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

SliverToBoxAdapter _buildMenuGrid(double screenHeight) {
  return SliverToBoxAdapter(
    child: Container(
      height: 195,
      child: IgnorePointer(
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          children: <Widget>[
            _gridItemMenu(Icons.person),
            _gridItemMenu(Icons.ac_unit),
            _gridItemMenu(Icons.list),
            _gridItemMenu(Icons.bar_chart),
            _gridItemMenu(Icons.mail),
            _gridItemMenu(Icons.phone),
            _gridItemMenu(Icons.pages),
            // _gridItemMenu(Icons.tap_and_play_rounded),
            // _gridItemMenu(Icons.airport_shuttle),
            _gridItemMenu(Icons.airplanemode_on),
          ],
        ),
      ),
    ),
  );
}

_gridItemMenu(icon) {
  return Column(
    children: <Widget>[
      CircleAvatar(
        // minRadius: 20.0,
        maxRadius: 30.0,
        child: Icon(
          icon,
          size: 30.0,
          color: Colors.white,
        ),
        backgroundColor: Palette.secondaryColor,
      ),
      SizedBox(
        height: 10.0,
      ),
      Text('data menu')
    ],
  );
}
