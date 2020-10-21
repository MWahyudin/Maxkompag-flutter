import 'package:flutter/material.dart';

class MargaStatistikScreen extends StatefulWidget {
  MargaStatistikScreen({Key key}) : super(key: key);

  @override
  _MargaStatistikScreenState createState() => _MargaStatistikScreenState();
}

class _MargaStatistikScreenState extends State<MargaStatistikScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Marga'),
        ),
      ),
    );
  }
}
