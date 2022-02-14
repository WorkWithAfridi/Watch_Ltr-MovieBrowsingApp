import 'package:flutter/material.dart';
import 'package:watch_ltr/constants/customColors.dart';
import 'package:watch_ltr/screens/home.dart';

import '../constants/customTextStyle.dart';

class OnBoarding extends StatelessWidget {
  static const route = '/onBoarding';
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            SizedBox.expand(
              child: Image.asset(
                'assets/background_img.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.black.withOpacity(.8),
            ),
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: MediaQuery.of(context).size.height * .65,
                    width: MediaQuery.of(context).size.width * .85,
                    color: red,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: FittedBox(
                            child: Text(
                              'Watch Ltr.',
                              style: titleTS,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .08,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: Text(
                            "SEE WHAT'S NEXT",
                            style: subTitleTS.copyWith(
                                letterSpacing: 2, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: Text(
                            "Bookmark anything, anywhere.",
                            style: defaultTS.copyWith(
                                fontWeight: FontWeight.w400, letterSpacing: 1),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .02,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 22),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(Home.route);
                            },
                            child: Card(
                              elevation: 15,
                              child: Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                                color: black,
                                alignment: Alignment.center,
                                child: Text(
                                  'JOIN NOW!!',
                                  style: normalTitleTS,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'SIGN IN',
                      style: defaultTS.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: white.withOpacity(.6),
                      ),
                    ),
                    Text(
                      'HELP',
                      style: defaultTS.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: white.withOpacity(.6),
                      ),
                    ),
                    Text(
                      'PLATFORM',
                      style: defaultTS.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: white.withOpacity(.6),
                      ),
                    ),
                    Text(
                      'PLAN',
                      style: defaultTS.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: white.withOpacity(.6),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
