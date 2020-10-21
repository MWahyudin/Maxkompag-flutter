import 'package:flutter/material.dart';

class GelarStatistikScreen extends StatefulWidget {
  GelarStatistikScreen({Key key}) : super(key: key);

  @override
  _GelarStatistikScreenState createState() => _GelarStatistikScreenState();
}

class _GelarStatistikScreenState extends State<GelarStatistikScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Gelar'),
        ),
      ),
    );
  }
}
