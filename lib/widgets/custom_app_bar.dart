import 'package:flutter/material.dart';
import 'package:kompag/config/palette.dart';
import 'package:kompag/screens/auth/login_screen.dart';
import 'package:kompag/screens/dashboard/wilayah/wilayah_list_screen.dart';
import 'package:page_transition/page_transition.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => Size(double.infinity, 240);
  const CustomAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        child: Container(
          margin: EdgeInsets.only(left: 12, top: 6),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Maxproit Solution',
                      style: TextStyle(fontSize: 25, color: Colors.white)),
                  // Text(
                  //   'Daftar Wilayah',
                  //   style: TextStyle(
                  //       color: Colors.white,
                  //       fontWeight: FontWeight.bold,
                  //       fontSize: 20),
                  // ),
                  IconButton(
                    iconSize: 35,
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    'Hi,Amanda',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  Text(
                    'Point kamu saat ini 657 pts',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  )
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
                    // print('tap search');
                    // Navigator.push(
                    //     context,
                    //     PageTransition(
                    //         type: PageTransitionType.fade,
                    //         child: LoginScreen()));

                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: ' ...',
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
                              Icons.link,
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
            ],
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
