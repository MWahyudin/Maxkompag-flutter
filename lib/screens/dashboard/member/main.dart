import 'package:dio/dio.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kompag/config/palette.dart';
import 'package:kompag/widgets/custom_app.dart';
import 'package:sizer/sizer.dart';

class MemberScreen extends StatefulWidget {
  MemberScreen({Key key}) : super(key: key);

  @override
  _MemberScreenState createState() => _MemberScreenState();
}

class _MemberScreenState extends State<MemberScreen> {
  @override
  Widget build(BuildContext context) {
    //  SizerUtil().init(constraints, orientation);
    // final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(
        builder: (context, orientation) {
            //initialize SizerUtil()
            SizerUtil().init(constraints, orientation);  //initialize SizerUtil
            return Scaffold(
      appBar: CustomAppMain(
        // title: "Maxpro Kompag",
      ),
      body: SingleChildScrollView(
              child: Column(
          children: <Widget>[
            new HeaderMember(),
            new ListMember(),
          ],
        ),
      ),
      floatingActionButton: FabCircularMenu(
        fabOpenColor: Colors.white,
        fabColor: Palette.secondaryColor,
        ringWidth: screenWidth * 0.2,
        ringColor: Palette.secondaryColor,
        ringDiameter: screenWidth * 0.7,
        fabSize: 70.0,
        fabOpenIcon: Icon(Icons.menu, color: Colors.white),
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            onPressed: () {
              print('Home');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.star_outline,
              color: Colors.white,
            ),
            onPressed: () {
              print('Home');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.place,
              color: Colors.white,
            ),
            onPressed: () {
              print('Home');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.local_activity,
              color: Colors.white,
            ),
            onPressed: () {
              print('Home');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            onPressed: () {
              print('Favorite');
            },
          )
        ],
      ),

      // Column(
      //   children: <Widget>[
      //     new HeaderMember(),
      //     new ListMember(),
      //   ],
      // ),
    );
          },
      );
    });
    // return Scaffold(
    //   appBar: CustomAppMain(
    //     // title: "Maxpro Kompag",
    //   ),
    //   body: SingleChildScrollView(
    //           child: Column(
    //       children: <Widget>[
    //         new HeaderMember(),
    //         new ListMember(),
    //       ],
    //     ),
    //   ),
    //   floatingActionButton: FabCircularMenu(
    //     fabOpenColor: Colors.white,
    //     fabColor: Palette.secondaryColor,
    //     ringWidth: screenWidth * 0.2,
    //     ringColor: Palette.secondaryColor,
    //     ringDiameter: screenWidth * 0.7,
    //     fabSize: 70.0,
    //     fabOpenIcon: Icon(Icons.menu, color: Colors.white),
    //     children: <Widget>[
    //       IconButton(
    //         icon: Icon(
    //           Icons.home,
    //           color: Colors.white,
    //         ),
    //         onPressed: () {
    //           print('Home');
    //         },
    //       ),
    //       IconButton(
    //         icon: Icon(
    //           Icons.star_outline,
    //           color: Colors.white,
    //         ),
    //         onPressed: () {
    //           print('Home');
    //         },
    //       ),
    //       IconButton(
    //         icon: Icon(
    //           Icons.place,
    //           color: Colors.white,
    //         ),
    //         onPressed: () {
    //           print('Home');
    //         },
    //       ),
    //       IconButton(
    //         icon: Icon(
    //           Icons.local_activity,
    //           color: Colors.white,
    //         ),
    //         onPressed: () {
    //           print('Home');
    //         },
    //       ),
    //       IconButton(
    //         icon: Icon(
    //           Icons.favorite,
    //           color: Colors.white,
    //         ),
    //         onPressed: () {
    //           print('Favorite');
    //         },
    //       )
    //     ],
    //   ),

    //   // Column(
    //   //   children: <Widget>[
    //   //     new HeaderMember(),
    //   //     new ListMember(),
    //   //   ],
    //   // ),
    // );
  }
}

class HeaderMember extends StatefulWidget {
  // final double screenHeight;

  @override
  _HeaderMemberState createState() => _HeaderMemberState();
}

class _HeaderMemberState extends State<HeaderMember> {
  @override
  Widget build(BuildContext context) {
    // getMember();
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 10.0,
      ),
      padding: EdgeInsets.all(10.0),
      // color: Colors.blue,
      height: screenHeight * 0.20,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Palette.primaryColor, Palette.secondaryColor],
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SvgPicture.asset('assets/images/undraw_team.svg',
              width: MediaQuery.of(context).size.width * 0.4),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Kini hanya lewat Gadget',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0.sp,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Text(
                'Semua saling terhubung',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10.0.sp,
                ),
                maxLines: 2,
                // textAlign: TextAlign.center,
              ),
            ],
          )
          // SvgPicture.asset('assets/images/undraw_Content3.svg')
        ],
      ),
    );
  }
}

class ListMember extends StatefulWidget {
  ListMember({Key key}) : super(key: key);

  @override
  _ListMemberState createState() => _ListMemberState();
}

class _ListMemberState extends State<ListMember> {
  Future<List> members;
  Future<List> getMember() async {
    String uri = 'http://apikompag.maxproitsolution.com/api/anggota/member';
    Response response = await Dio().get(uri);

    return response.data['data'];
  }

  @override
  void initState() {
    members = getMember();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 14, left: 16),
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Daftar member',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400)),
            ],
          ),
        ),
        Container(
          height: screenHeight * 0.7,
          padding: EdgeInsets.all(12),
          child: FutureBuilder<List>(
            future: members,
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        // print('hi');
                      },
                      child: Card(
                        elevation: 10,
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Id : ${snapshot.data[index]['id_member']}",
                              ),
                              Text(
                                "Nama : ${snapshot.data[index]['nama']}",
                              ),
                              Text(
                                "Marga : ${snapshot.data[index]['marga']}",
                              ),
                              Text(
                                "Parompuon : ${snapshot.data[index]['parompuon']}",
                              ),
                              Text(
                                "Sektor : ${snapshot.data[index]['sektor']}",
                              ),
                              Text(
                                "Wilayah : ${snapshot.data[index]['wilayah']}",
                              ),
                              Text(
                                "Email : ${snapshot.data[index]['email']}",
                              ),
                              Text(
                                "No Hp : ${snapshot.data[index]['no_hp']}",
                              ),
                              Text(
                                "Registrasi : ${snapshot.data[index]['tgl_registrasi']}",
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
              return Text('ga ada data');
            },
          ),
        )
      ],
    );
  }
}
