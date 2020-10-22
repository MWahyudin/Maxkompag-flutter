import 'package:flutter/material.dart';
import 'package:kompag/config/palette.dart';
import 'package:kompag/models/marga_model.dart';
import 'package:kompag/models/sektor_model.dart';
import 'package:kompag/services/services.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class SektorStatistikScreen extends StatefulWidget {
  @override
  _SektorStatistikScreenState createState() => _SektorStatistikScreenState();
}

class _SektorStatistikScreenState extends State<SektorStatistikScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Statistik Sektor', style: TextStyle(fontSize: 22)),
          backgroundColor: Palette.secondaryColor,
        ),
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: Palette.secondaryColor,
        //   onPressed: () => setState(() => refresh()),
        //   tooltip: 'refresh ...',
        //   child: const Icon(
        //     Icons.refresh,
        //     color: Colors.white,
        //   ),
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        backgroundColor: Colors.white,
        body: Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(right: 30),
                    child: Text(
                      'Swipe ke kiri untuk melihat data lebih',
                      style: TextStyle(fontSize: 20),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.010,
                ),
                Main(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<charts.Series<Sektor, String>> dataList(List<Sektor> _list) {
  return [
    new charts.Series<Sektor, String>(
      id: 'Covid Infect',
      domainFn: (Sektor items, _) => items.nama,
      measureFn: (Sektor items, _) => items.jumlahAnggota,
      data: _list,
      labelAccessorFn: (Sektor item, _) => '${item.jumlahAnggota}',
      insideLabelStyleAccessorFn: (Sektor jumlahAnggota, _) {
        return new charts.TextStyleSpec(color: charts.MaterialPalette.white);
      },
      fillColorFn: (_, __) =>
          charts.ColorUtil.fromDartColor(Palette.secondaryColor),
      // labelAccessorFn: (LinearSales row, _) => '${row.year}: ${row.sales}',
    )
  ];
}

class Main extends StatefulWidget {
  const Main({Key key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  Future<List<Sektor>> _sektor;
  // List<Marga> margadata;

  @override
  void initState() {
    super.initState();
    refresh();
  }

  refresh() {
    _sektor = Services.getSektor();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _sektor,
        builder: (context, snapshot) {
          // print(snapshot.data[0].namaWilayah);
          // print(snapshot.data[0].nama),

          if (snapshot.connectionState == ConnectionState.done)
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 22,
                height: MediaQuery.of(context).size.height * 0.8,
                child: new charts.BarChart(dataList(snapshot.data),
                    animate: true,
                    barRendererDecorator:
                        new charts.BarLabelDecorator<String>(),
                    domainAxis: new charts.OrdinalAxisSpec(
                        renderSpec: new charts.SmallTickRendererSpec(

                            // Tick and Label styling here.
                            labelStyle: new charts.TextStyleSpec(
                                fontSize: 10, // size in Pts.
                                color: charts.MaterialPalette.black),

                            // Change the line colors to match text color.
                            lineStyle: new charts.LineStyleSpec(
                                color:
                                    charts.MaterialPalette.blue.shadeDefault))),
                    primaryMeasureAxis: new charts.NumericAxisSpec(
                        renderSpec: new charts.GridlineRendererSpec(

                            // Tick and Label styling here.
                            labelStyle: new charts.TextStyleSpec(
                                fontSize: 14, // size in Pts.
                                color: charts.MaterialPalette.black),

                            // Change the line colors to match text color.
                            lineStyle: new charts.LineStyleSpec(
                                color: charts
                                    .MaterialPalette.blue.shadeDefault)))),
              ),
            );
          else
            return Center(child: CircularProgressIndicator());
        });
  }
}
