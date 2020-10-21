import 'package:flutter/material.dart';

class GenerasiStatistikScreen extends StatefulWidget {
  GenerasiStatistikScreen({Key key}) : super(key: key);

  @override
  _GenerasiStatistikScreenState createState() =>
      _GenerasiStatistikScreenState();
}

class _GenerasiStatistikScreenState extends State<GenerasiStatistikScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
        title: Text('Generasi'),
      )),
    );
  }
}
