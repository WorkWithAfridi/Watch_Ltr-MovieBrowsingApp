import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:watch_ltr/resources/auth_methods.dart';
import 'package:watch_ltr/screens/homeTab.dart';
import 'package:watch_ltr/screens/widgets/customTextField.dart';

import '../constants/customColors.dart';
import '../constants/customTextStyle.dart';

class SignUp extends StatefulWidget {
  static const route = '/OnBoarding/SignUp';
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController userNameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: red,
          elevation: 0,
        ),
      ),
      backgroundColor: red,
      body: Stack(
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
            color: red.withOpacity(.9),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 60,
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: white,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: FittedBox(
                          child: Text(
                            'Watch Ltr.',
                            style: AppTitleTS.copyWith(fontSize: 45),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 55),
                        child: Text(
                          "Your one stop solution for all your media queries.",
                          textAlign: TextAlign.center,
                          style: AuthorTS.copyWith(
                              color: black,
                              fontWeight: FontWeight.w900,
                              fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Card(
                          elevation: 10,
                          color: Colors.transparent,
                          child: CustomTextField(
                              textEditingController:
                                  userNameTextEditingController,
                              hintText: 'Please enter your username',
                              textInputType: TextInputType.name),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Card(
                          elevation: 10,
                          color: Colors.transparent,
                          child: CustomTextField(
                              textEditingController: emailTextEditingController,
                              hintText: 'Please enter your email address',
                              textInputType: TextInputType.emailAddress),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Card(
                          elevation: 10,
                          color: Colors.transparent,
                          child: CustomTextField(
                            textEditingController:
                                passwordTextEditingController,
                            hintText: 'Please enter your password',
                            textInputType: TextInputType.text,
                            isPass: true,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 26),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                setState(() {
                                  isLoading = true;
                                });
                                // if (emailTextEditingController
                                //         .text.isNotEmpty ||
                                //     passwordTextEditingController
                                //         .text.isNotEmpty ||
                                //     userNameTextEditingController
                                //         .text.isNotEmpty) {
                                //   String res = await AuthMethods().signUpUser(
                                //     userEmail: emailTextEditingController.text,
                                //     password:
                                //         passwordTextEditingController.text,
                                //     userName:
                                //         userNameTextEditingController.text,
                                //     context: context,
                                //   );
                                //
                                //   setState(() {
                                //     isLoading = false;
                                //   });
                                //
                                //   ScaffoldMessenger.of(context).showSnackBar(
                                //     SnackBar(
                                //       content: Text(
                                //         res.toString(),
                                //         style: defaultTS.copyWith(color: white),
                                //       ),
                                //       backgroundColor: black,
                                //     ),
                                //   );
                                //   Navigator.of(context)
                                //       .pushNamed(HomeTab.route);
                                // } else {
                                //   setState(() {
                                //     isLoading = false;
                                //   });
                                //   ScaffoldMessenger.of(context).showSnackBar(
                                //     SnackBar(
                                //       content: Text('Fields cannot be empty!'),
                                //       backgroundColor: red,
                                //     ),
                                //   );
                                // }

                                Navigator.of(context).pushNamed(HomeTab.route);
                              },
                              child: isLoading
                                  ? Container(
                                      height: 50,
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          color: black,
                                        ),
                                      ),
                                    )
                                  : Card(
                                      color: Colors.transparent,
                                      elevation: 15,
                                      child: Container(
                                        height: 50,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: black.withOpacity(.9),
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          'SIGN UP',
                                          style: TitleTS,
                                        ),
                                      ),
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Powered By",
                      style: AuthorTS.copyWith(color: black),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 15,
                      width: double.infinity,
                      child: Image.asset(
                        'assets/theMovieDB_logo.png',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
