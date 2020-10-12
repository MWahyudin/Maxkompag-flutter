import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kompag/config/palette.dart';
import 'package:kompag/data/data.dart';
import 'package:kompag/widgets/custom_app_bar.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          _buildMenuGrid(screenHeight),
          _buildTipsSection(screenHeight)
        ],
      ),
    );
  }
}

SliverToBoxAdapter _buildTipsSection(double screenHeight) {
  return SliverToBoxAdapter(
    child: Container(
      padding: const EdgeInsets.only(top: 20,left: 20, right: 20),
      // color: Colors.orange,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Tips',
            style: const TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              // padding: EdgeInsets.fromLTRB(10.0, 0.0, 15.0, 0.0),
              child: Container(
                // padding: EdgeInsets.only(right: 20),
                // padding: EdgeInsets.all(30),
                // margin: EdgeInsets.all(4),
                child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: postTips
                        .map(
                          (e) => Container(
                            padding: EdgeInsets.only(right: 15),
                            child: InkWell(
                              onTap: () {
                                print(e['link']);
                              },
                              child: Column(
                                children: <Widget>[
                                  Image.asset(
                                    e.keys.first,
                                    height: screenHeight * 0.12,
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.015,
                                  ),
                                  Text(
                                    e.values.first,
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList()),
              )),
        ],
      ),
    ),
  );
}

SliverToBoxAdapter _buildDataWilayah(double screenHeight) {
  return SliverToBoxAdapter(
    child: Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Container(
            color: Colors.red,
            height: 100,
            child: Row(
              children: <Widget>[Text('Hello')],
            ),
          )
        ],
      ),
    ),
  );
}

SliverToBoxAdapter _buildFormSearch(double screenHeight) {
  return SliverToBoxAdapter(
    child: Padding(
      padding: EdgeInsets.only(
        // top:250,
        top: 15,
        left: 16.0,
      ),
      child: Row(
        children: <Widget>[
          Text(
            'Data Wilayah',
            style: TextStyle(fontSize: 25),
          ),
          // SizedBox(
          //   height: screenHeight * 0.1,
          // ),
        ],
      ),
    ),
  );
}

SliverToBoxAdapter _buildMenuGrid(double screenHeight) {
  return SliverToBoxAdapter(
    child: Container(
      height: 195,
      child: IgnorePointer(
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          children: <Widget>[
            _gridItemMenu(Icons.person),
            _gridItemMenu(Icons.ac_unit),
            _gridItemMenu(Icons.list),
            _gridItemMenu(Icons.bar_chart),
            _gridItemMenu(Icons.mail),
            _gridItemMenu(Icons.phone),
            _gridItemMenu(Icons.pages),
            // _gridItemMenu(Icons.tap_and_play_rounded),
            // _gridItemMenu(Icons.airport_shuttle),
            _gridItemMenu(Icons.airplanemode_on),
          ],
        ),
      ),
    ),
  );
}

_gridItemMenu(icon) {
  return Column(
    children: <Widget>[
      CircleAvatar(
        // minRadius: 20.0,
        maxRadius: 30.0,
        child: Icon(
          icon,
          size: 30.0,
          color: Colors.white,
        ),
        backgroundColor: Palette.secondaryColor,
      ),
      SizedBox(
        height: 10.0,
      ),
      Text('data menu')
    ],
  );
}

class WilayahCard extends StatefulWidget {
  WilayahCard({Key key}) : super(key: key);

  @override
  _WilayahCardState createState() => _WilayahCardState();
}

class _WilayahCardState extends State<WilayahCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      height: 100.0,
    );
  }
}
