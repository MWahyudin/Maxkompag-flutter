import 'package:flutter/material.dart';

class PekerjaanStatistikScreen extends StatefulWidget {
  PekerjaanStatistikScreen({Key key}) : super(key: key);

  @override
  _PekerjaanStatistikScreenState createState() => _PekerjaanStatistikScreenState();
}

class _PekerjaanStatistikScreenState extends State<PekerjaanStatistikScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Pekerjaan'),
        ),
      ),
    );
  }
}
