import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kompag/config/palette.dart';
import 'package:kompag/models/wilayah_model.dart';
import 'package:kompag/services/services.dart';

class WilayahStatistikScreen extends StatefulWidget {
  WilayahStatistikScreen({Key key}) : super(key: key);

  @override
  _WilayahStatistikScreenState createState() => _WilayahStatistikScreenState();
}

class _WilayahStatistikScreenState extends State<WilayahStatistikScreen> {
  List _wilayahs;
  bool _isLoading;
  var _dataTest;
  @override
  void initState() {
    _isLoading = true;
    super.initState();
    Services.getWilayah().then((wilayahs) {
      setState(() {
        _isLoading = false;

        _wilayahs = wilayahs;
        _dataTest = wilayahs.map((e) => e);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_dataTest);
    final screenHeight = MediaQuery.of(context).size.height;

    // var chart = charts.BarChart(series);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 1,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Palette.secondaryColor,
            bottom: TabBar(
              indicatorColor: Color(0xff020bf5),
              tabs: [
                Tab(
                  icon: FaIcon(FontAwesomeIcons.solidChartBar),
                ),
                // Tab(
                //   icon: FaIcon(FontAwesomeIcons.chartPie),
                // ),
                // Tab(
                //   icon: FaIcon(FontAwesomeIcons.chartLine),
                // ),
              ],
            ),
            title: Text(_isLoading ? "Loading ..." : "Wilayah Statistik"),
          ),
          body: TabBarView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text('Statistik pertahun'),
                        Expanded(
                            child: Container(
                          color: Colors.white,
                          child: ListView.builder(
                              itemCount: null == _wilayahs ? 0 : _wilayahs.length,
                              itemBuilder: (context, index) {
                                Wilayah wilayah = _wilayahs[index];
                                return ListTile(
                                  title: Text(wilayah.nama),
                                  subtitle: Text(wilayah.jumlahVerifikasi.toString()),
                                );
                              }),
                        ))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // body:
    );
  }
}
