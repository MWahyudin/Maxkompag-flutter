import 'package:awesome_button/awesome_button.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:kompag/config/palette.dart';
import 'package:kompag/screens/auth/login_screen.dart';
import 'package:kompag/screens/dashboard/main.dart';
import 'package:page_transition/page_transition.dart';
import 'package:slider_button/slider_button.dart';

class OnBoardingScreen extends StatelessWidget {
  List<PageViewModel> getPages() {
    return [
      PageViewModel(
          image: Center(
            child: Image.asset('assets/images/undraw_business_decisions.png'),
          ),
          title: 'Selamat datang di KOMPAG App',
          body: 'Semua lebih mudah dengan KOMPAG App',
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(color: Color(0xFF6C63FF)),
            bodyTextStyle: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20.0,
                color: Color(0xFF6C63FF)),
            pageColor: Colors.white,
          ),
          footer: Text('@maxproitsolution',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ))),
      PageViewModel(
          image: Center(
            child: Image.asset('assets/images/undraw_Devices.png'),
          ),
          title: 'Kapanpun dan dimanapu',
          body: 'Semua lebih mudah dengan KOMPAG App',
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(color: Color(0xFF6C63FF)),
            bodyTextStyle: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20.0,
                color: Color(0xFF6C63FF)),
            pageColor: Colors.white,
          ),
          footer: Text('@maxproitsolution',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ))),
      PageViewModel(
          image: Center(
            child: Image.asset('assets/images/undraw_Mind_map.png'),
          ),
          title: 'Gak perlu repot',
          body: 'Semua lebih mudah dengan KOMPAG App',
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(color: Color(0xFF6C63FF)),
            bodyTextStyle: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20.0,
                color: Color(0xFF6C63FF)),
            pageColor: Colors.white,
          ),
          footer: Text('@maxproitsolution',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ))),
      PageViewModel(
          image: Center(
            child: Image.asset('assets/images/undraw_Team_page_re.png'),
          ),
          title: 'Gak perlu repot',
          body: 'Semua lebih mudah dengan KOMPAG App',
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(color: Color(0xFF6C63FF)),
            bodyTextStyle: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20.0,
                color: Color(0xFF6C63FF)),
            pageColor: Colors.white,
          ),
          footer: Text('@maxproitsolution',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ))),
      PageViewModel(
        image: Center(
          child: Image.asset('assets/images/undraw_remote_meeting.png'),
        ),
        title: 'Mudah digunakan',
        decoration: const PageDecoration(
          titleTextStyle: TextStyle(color: Color(0xFF6C63FF)),
          bodyTextStyle: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 20.0, color: Color(0xFF6C63FF)),
          pageColor: Colors.white,
        ),
        body: 'Semua lebih mudah dengan KOMPAG App',
        footer: Center(
          child: SliderButton(
            action: () {
              ///Do something here
              // Navigator.of(context).pop();
              print('ok');
            },
            label: Text(
              "Mari bergabung",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 17),
            ),
            icon: Center(
              child: Icon(
                Icons.check,
                color: Color(0xFF6C63FF),
                size: 40.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
            ),

            ///Change All the color and size from here.
            // width: 230,
            // radius: 10,
            buttonSize: 70,
            buttonColor: Colors.white,
            // backgroundColor: Color(0xff534bae),
            highlightedColor: Color(0xFF6C63FF),
            baseColor: Colors.black,
          ),
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      curve: Curves.bounceInOut,
      animationDuration: 400,
      // done: Text(
      //   'Done',
      //   style: TextStyle(color: Colors.black),
      // ),
      onDone: () {
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.fade, child: MainScreen()));
      },
      pages: getPages(),
      globalBackgroundColor: Color(0xFF6C63FF),
      onSkip: () {},
      // showSkipButton: true,
      // skip: const Icon(Icons.skip_next),
      showSkipButton: true,
      skip: const Text(
        "Skip",
        style: TextStyle(color: Color(0xFF6C63FF)),
      ),
      next: const Icon(
        Icons.navigate_next,
        color: Color(0xFF6C63FF),
      ),
      done: AwesomeButton(
        blurRadius: 10.0,
        splashColor: Color.fromRGBO(255, 255, 255, .4),
        borderRadius: BorderRadius.circular(50.0),
        height: 50.0,
        width: 60.0,
        onTap: () => Navigator.push(
            context,
            PageTransition(
                // curve: Curves.easeIn,
                type: PageTransitionType.leftToRight,
                child: MainScreen())),
        color: Colors.white,
        child: Icon(
          Icons.login,
          color: Color(0xFF6C63FF),
          size: 50.0,
        ),
      ),
      dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: Color(0xFF6C63FF),
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0))),
    );
  }
}
