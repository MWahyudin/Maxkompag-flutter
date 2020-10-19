import 'package:charts_flutter/flutter.dart' as charts;
import 'package:colour/colour.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kompag/config/palette.dart';

class SektorScreen extends StatefulWidget {
  SektorScreen({Key key}) : super(key: key);

  @override
  _SektorScreenState createState() => _SektorScreenState();
}

class _SektorScreenState extends State<SektorScreen> {
  List<charts.Series<Sektor, String>> _seriesPieData;
  generateData() {
    var pieData = [
      Sektor("Jakarta 1", "JAkarta Utara", 100, 30, 56, Colour('#6C63FF')),
      Sektor("Jakarta 2", "JAkarta Utara", 40, 30, 56, Colour('#f54242')),
      Sektor("Jakarta 3", "JAkarta Utara", 30, 30, 56, Colour('#93f542')),
      Sektor("Jakarta 4", "JAkarta Utara", 50, 30, 56, Colour('#42cbf5')),
      Sektor("Jakarta 5", "JAkarta Utara", 75, 30, 56, Colour('#f2f542')),
    ];
    _seriesPieData.add(
      charts.Series(
        data: pieData,
        domainFn: (Sektor sektor, _) => sektor.nama,
        measureFn: (Sektor sektor, _) => sektor.anggota,
        colorFn: (Sektor sektor, _) =>
            charts.ColorUtil.fromDartColor(sektor.colorVal),
        id: "Statistik Sektor",
        labelAccessorFn: (Sektor row, _) => '${row.anggota}',
      ),
    );
  }

  @override
  void initState() {
    _seriesPieData = List<charts.Series<Sektor, String>>();
    super.initState();
    generateData();
  }

  @override
  Widget build(BuildContext context) {
    // var series = [
    //   charts.Series(
    //       domainFn: (Sektor sektor, _) => sektor.nama,
    //       measureFn: (Sektor sektor, _) => sektor.anggota,
    //       id: 'Sektor',
    //       data: data)
    // ];

    // var chart = charts.BarChart(series);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Palette.secondaryColor,
            bottom: TabBar(
              indicatorColor: Color(0xff020bf5),
              tabs: [
                Tab(
                  icon: FaIcon(FontAwesomeIcons.solidChartBar),
                ),
                Tab(
                  icon: FaIcon(FontAwesomeIcons.chartPie),
                ),
                Tab(
                  icon: FaIcon(FontAwesomeIcons.chartLine),
                ),
              ],
            ),
            title: Text("Sektor Statistik"),
          ),
        ),
      ),
      // body:
    );
  }
}

class Sektor {
  final String nama;
  final String namaWilayah;
  final int anggota;
  final int verif;
  final int keluarga;
  final Colour colorVal;

  Sektor(this.nama, this.namaWilayah, this.anggota, this.verif, this.keluarga,
      this.colorVal);
}
