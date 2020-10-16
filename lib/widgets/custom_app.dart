import 'package:flutter/material.dart';
import 'package:kompag/components/rounded_input_field.dart';
import 'package:kompag/config/palette.dart';
import 'package:kompag/screens/auth/login_screen.dart';
import 'package:kompag/screens/dashboard/member/main.dart';
import 'package:kompag/screens/dashboard/wilayah/wilayah_list_screen.dart';
import 'package:page_transition/page_transition.dart';

class CustomAppMain extends StatefulWidget with PreferredSizeWidget {
  final String title;
  final String idMember;
  const CustomAppMain({Key key, this.title, this.idMember}) : super(key: key);

  @override
  _CustomAppMainState createState() => _CustomAppMainState(idMember);

  @override
  Size get preferredSize => Size(double.infinity, 180);
}

class _CustomAppMainState extends State<CustomAppMain> {
  // Create a text controller. Later, use it to retrieve the
  // current value of the TextField.
  String idMember;
  final searchController = TextEditingController();

  _CustomAppMainState(this.idMember);

  @override
  void initState() {
    super.initState();
    searchController.addListener(_printLatestValue);
   
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    searchController.dispose();
    super.dispose();
  }

  _printLatestValue() {
    // print("Second text field: ${searchController.text}");
     setState(() {
      idMember = searchController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("$idMember");
    final screenHeight = MediaQuery.of(context).size.height;
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        // color: Palette.primaryColor,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [firstColor, secondColor]),
          // color: Palette.primaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.red,
              blurRadius: 20,
              offset: Offset(0, 0),
            )
          ],
        ),
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.only(left: 12, top: 12),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Cari data ?',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    // Text(
                    //   'Daftar Wilayah',
                    //   style: TextStyle(
                    //       color: Colors.white,
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 20),
                    // ),
                    // IconButton(
                    //   iconSize: 35,
                    //   icon: Icon(
                    //     Icons.search,
                    //     color: Colors.white,
                    //   ),
                    //   onPressed: () {},
                    // ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 23),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                    child: TextField(
                      controller: searchController,
                      // controller: searchController,
                      // onChanged: (text) {
                      //   print("First text field: $text");
                      // },
                      // print('tap search');
                      // Navigator.push(
                      //     context,
                      //     PageTransition(
                      //         type: PageTransitionType.fade,
                      //         child: LoginScreen()));

                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: ' ID Member ...',
                          suffixIcon: Material(
                            elevation: 2.0,
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.0),
                            ),
                            child: InkWell(
                              onTap: () {
                                print('hi');
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        duration: Duration(milliseconds: 500),
                                        type: PageTransitionType.fade,
                                        child: WilayahListScreen()));
                              },
                              child: Icon(
                                Icons.person_search_rounded,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          // border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 32.0, vertical: 14.0)),
                    ),
                  ),
                )

                // SizedBox(
                //   height: screenHeight * 0.01,
                // ),
                // HeaderMember()
                // RoundedInputField(hintText: 'Masukan ID member', icon: Icons.person_search,)
              ],
            ),
          ),
        ),
      ),
    );
    // Container();
  }
}

Color firstColor = Color(0xFF020bf5);
Color secondColor = Color(0xFF6C63FF);

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0.0, size.height);
    var firstEndPoint = Offset(size.width * .5, size.height - 30.0);
    var firstControlPoint = Offset(size.width * 0.25, size.height - 50.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 80.0);
    var secondControlPoint = Offset(size.width * .75, size.height - 10.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
