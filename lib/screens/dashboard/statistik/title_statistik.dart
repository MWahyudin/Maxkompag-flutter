import 'package:flutter/material.dart';

class TitleStatistikScreen extends StatefulWidget {
  TitleStatistikScreen({Key key}) : super(key: key);

  @override
  _TitleStatistikScreenState createState() => _TitleStatistikScreenState();
}

class _TitleStatistikScreenState extends State<TitleStatistikScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Title'),
        ),
      ),
    );
  }
}
