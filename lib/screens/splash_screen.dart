import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:watch_ltr/constants/customTextStyle.dart';
import 'package:watch_ltr/screens/onBoarding.dart';

import '../constants/customColors.dart';

class SplashScreen extends StatefulWidget {
  static const route = '/spash_screen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    triggerSplashScreen();
  }

  void triggerSplashScreen() {
    Future.delayed(
      Duration(seconds: 3),
    ).then(
      (value) {
        Navigator.of(context).pushNamed(OnBoarding.route);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 35,),
            Container(
              height: MediaQuery.of(context).size.height * .15,
              width: MediaQuery.of(context).size.height * .15,
              child: Lottie.asset(
                  'assets/lottie_animations/splash_screen_lottie_animation.json'),
            ),
            Text(
              'WATCH LTR.',
              style: AppTitleTS,
            ),
            Text(
              'by KYOTO',
              style: AuthorTS,
            )
          ],
        ),
      ),
    );
  }
}
