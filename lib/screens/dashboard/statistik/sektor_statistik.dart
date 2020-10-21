import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kompag/config/palette.dart';
import 'package:kompag/models/sektor_model.dart';
import 'package:kompag/services/services.dart';

class SektorStatistikScreen extends StatefulWidget {
  SektorStatistikScreen({Key key}) : super(key: key);

  @override
  _SektorStatistikScreenState createState() => _SektorStatistikScreenState();
}

class _SektorStatistikScreenState extends State<SektorStatistikScreen> {
  List _sektors;
  bool _isLoading;
  var _dataTest;
  @override
  void initState() {
    _isLoading = true;
    super.initState();
    // generateData();
    Services.getSektor().then((sektors) {
      //   _isLoading = false;

      // _sektors = sektors;
      setState(() {
        // _isLoading = false;
        _isLoading = false;

        _sektors = sektors;
        _dataTest = sektors.map((e) => e);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_dataTest);
    // print(_sektors);
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
            title: Text(_isLoading ? "Loading ..." : "Sektor Statistik"),
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
                              itemCount: null == _sektors ? 0 : _sektors.length,
                              itemBuilder: (context, index) {
                                Sektor sektor = _sektors[index];
                                return ListTile(
                                  title: Text(sektor.nama),
                                  subtitle: Text(sektor.namaWilayah),
                                );
                              }),
                        ))
                      ],
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.all(8.0),
              //   child: Container(
              //     child: Center(
              //       child: Column(
              //         children: <Widget>[
              //           Text(
              //             'Data statistik Sektor',
              //             style: TextStyle(
              //                 fontSize: 24.0, fontWeight: FontWeight.bold),
              //           ),
              //           SizedBox(
              //             height: screenHeight * 0.01,
              //           ),
              //           Expanded(
              //             child: charts.PieChart(
              //               _seriesPieData,
              //               animate: true,
              //               animationDuration: Duration(seconds: 5),
              //               behaviors: [
              //                 new charts.DatumLegend(
              //                   outsideJustification:
              //                       charts.OutsideJustification.endDrawArea,
              //                   horizontalFirst: false,
              //                   desiredMaxRows: 2,
              //                   cellPadding: new EdgeInsets.only(
              //                       right: 4.0, bottom: 4.0),
              //                   entryTextStyle: charts.TextStyleSpec(
              //                     color: charts
              //                         .MaterialPalette.purple.shadeDefault,
              //                     // fontFamily:
              //                     fontSize: 11,
              //                   ),
              //                 ),
              //               ],
              //               defaultRenderer: new charts.ArcRendererConfig(
              //                 arcWidth: 100,
              //                 arcRendererDecorators: [
              //                   new charts.ArcLabelDecorator(
              //                     labelPosition: charts.ArcLabelPosition.inside,
              //                   )
              //                 ],
              //               ),
              //             ),
              //           )
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.all(8.0),
              //   child: Container(
              //     child: Center(
              //         child: Column(
              //       children: <Widget>[
              //         Text(
              //           "Data statistik sektor",
              //           style: TextStyle(
              //               fontSize: 24.0, fontWeight: FontWeight.bold),
              //         ),
              //         Expanded(
              //           child: charts.LineChart(
              //             _seriesLineData,
              //             defaultRenderer: new charts.LineRendererConfig(
              //                 includeArea: true, stacked: true),
              //             animate: true,
              //             animationDuration: Duration(seconds: 5),
              //             behaviors: [
              //               new charts.ChartTitle('Sektor',
              //                   behaviorPosition:
              //                       charts.BehaviorPosition.bottom,
              //                   titleOutsideJustification:
              //                       charts.OutsideJustification.middleDrawArea),
              //               new charts.ChartTitle('Wilayah',
              //                   behaviorPosition: charts.BehaviorPosition.start,
              //                   titleOutsideJustification:
              //                       charts.OutsideJustification.middleDrawArea),
              //               new charts.ChartTitle('Anggota',
              //                   behaviorPosition: charts.BehaviorPosition.end,
              //                   titleOutsideJustification:
              //                       charts.OutsideJustification.middleDrawArea),
              //             ],
              //           ),
              //         )
              //       ],
              //     )),
              //   ),
              // )
            ],
          ),
        ),
      ),
      // body:
    );
  }
}
