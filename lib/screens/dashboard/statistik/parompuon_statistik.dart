import 'package:flutter/material.dart';

class ParompuonStatistikScreen extends StatefulWidget {
  ParompuonStatistikScreen({Key key}) : super(key: key);

  @override
  _ParompuonStatistikScreenState createState() => _ParompuonStatistikScreenState();
}

class _ParompuonStatistikScreenState extends State<ParompuonStatistikScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Parompuon'),
        ),
      ),
    );
  }
}
