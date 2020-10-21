import 'package:flutter/material.dart';

class KonsentrasiStatistikScreen extends StatefulWidget {
  KonsentrasiStatistikScreen({Key key}) : super(key: key);

  @override
  _KonsentrasiStatistikScreenState createState() => _KonsentrasiStatistikScreenState();
}

class _KonsentrasiStatistikScreenState extends State<KonsentrasiStatistikScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Konsentrasi'),
        ),
      ),
    );
  }
}
