import 'package:flutter/material.dart';
import 'package:kompag/config/palette.dart';
import 'package:kompag/models/marga_model.dart';
import 'package:kompag/services/services.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class MargaStatistikScreen extends StatefulWidget {
  @override
  _MargaStatistikScreenState createState() => _MargaStatistikScreenState();
}

class _MargaStatistikScreenState extends State<MargaStatistikScreen> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Statistik Marga', style: TextStyle(fontSize: 22)),
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

List<charts.Series<Marga, String>> dataList(List<Marga> _list) {
  return [
    new charts.Series<Marga, String>(
        id: 'Covid Infect',
        domainFn: (Marga items, _) => items.nama,
        measureFn: (Marga items, _) => items.jumlahAnggota,
        data: _list,
        labelAccessorFn: (Marga item, _) => '${item.jumlahAnggota}',
        insideLabelStyleAccessorFn: (Marga jumlahAnggota, _) {
          return new charts.TextStyleSpec(color: charts.MaterialPalette.white);
        },
        fillColorFn: (_, __) => charts.ColorUtil.fromDartColor(Palette.secondaryColor),
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
  Future<List<Marga>> _marga;
  // List<Marga> margadata;

  @override
  void initState() {
    super.initState();
    refresh();
  }

  refresh() {
    _marga = Services.getMarga();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _marga,
        builder: (context, snapshot) {
          // print(snapshot.data[12].nama);
          if (snapshot.connectionState == ConnectionState.done)
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 28,
                height: MediaQuery.of(context).size.height * 0.8,
                child: new charts.BarChart(dataList(snapshot.data),
                    animate: true,
                    barRendererDecorator:
                        new charts.BarLabelDecorator<String>(),
                    domainAxis: new charts.OrdinalAxisSpec(
                        renderSpec: new charts.SmallTickRendererSpec(

                            // Tick and Label styling here.
                            labelStyle: new charts.TextStyleSpec(
                                fontSize: 12, // size in Pts.
                                color: charts.MaterialPalette.black),

                            // Change the line colors to match text color.
                            lineStyle: new charts.LineStyleSpec(
                                color:
                                    charts.MaterialPalette.blue.shadeDefault))),
                    primaryMeasureAxis: new charts.NumericAxisSpec(
                        renderSpec: new charts.GridlineRendererSpec(

                            // Tick and Label styling here.
                            labelStyle: new charts.TextStyleSpec(
                                fontSize: 12, // size in Pts.
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
