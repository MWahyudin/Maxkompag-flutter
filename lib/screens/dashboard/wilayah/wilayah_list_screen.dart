import 'package:flutter/material.dart';
import 'package:kompag/config/palette.dart';
import 'package:kompag/widgets/custom_app_bar.dart';

class WilayahListScreen extends StatelessWidget {
  const WilayahListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Palette.secondaryColor,
        title: Text('Hasil Pencarian'),
        centerTitle: true,
        leading: InkWell(
          child: Icon(
            Icons.arrow_back,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          _BuildWilayah(),
        ],
      ),
    );
  }
}

class _BuildWilayah extends StatelessWidget {
  const _BuildWilayah({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: MyClipper(),
          child: Container(
            color: Palette.secondaryColor,
            height: 160.0,
          ),
        )
      ],
    );
  }
}
