import 'package:flutter/material.dart';

class KeahlianStatistikScreen extends StatefulWidget {
  KeahlianStatistikScreen({Key key}) : super(key: key);

  @override
  _KeahlianStatistikScreenState createState() => _KeahlianStatistikScreenState();
}

class _KeahlianStatistikScreenState extends State<KeahlianStatistikScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Keahlian'),
        ),
      ),
    );
  }
}
