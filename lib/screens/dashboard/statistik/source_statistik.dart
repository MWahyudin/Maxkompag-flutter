import 'package:flutter/material.dart';

class SourceStatistikScreen extends StatefulWidget {
  SourceStatistikScreen({Key key}) : super(key: key);

  @override
  _SourceStatistikScreenState createState() => _SourceStatistikScreenState();
}

class _SourceStatistikScreenState extends State<SourceStatistikScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Source'),
        ),
      ),
    );
  }
}
