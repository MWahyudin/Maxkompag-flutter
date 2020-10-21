import 'package:flutter/material.dart';

class PendidikanStatistikScreen extends StatefulWidget {
  PendidikanStatistikScreen({Key key}) : super(key: key);

  @override
  _PendidikanStatistikScreenState createState() => _PendidikanStatistikScreenState();
}

class _PendidikanStatistikScreenState extends State<PendidikanStatistikScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Pendidikan'),
        ),
      ),
    );
  }
}
