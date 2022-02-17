import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watch_ltr/constants/customColors.dart';
import 'package:watch_ltr/functions/openUrl.dart';
import 'package:watch_ltr/provider/home_provider.dart';
import 'package:watch_ltr/provider/search_provider.dart';
import 'package:watch_ltr/provider/show_details_provider.dart';
import 'package:watch_ltr/provider/userProvider.dart';
import 'package:watch_ltr/screens/homeTab.dart';
import 'package:watch_ltr/screens/onBoarding.dart';
import 'package:watch_ltr/screens/signUp.dart';
import 'package:watch_ltr/screens/splash_screen.dart';

import 'screens/SignIn.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => ShowDetailsProvider()),
        ChangeNotifierProvider(create: (context) => SearchProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: black,
          ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.route,
        routes: {
          SplashScreen.route: (context) => SplashScreen(),
          OnBoarding.route: (context) => OnBoarding(),
          OpenWebView.route: (context) => OpenWebView(),
          SignUp.route: (context) => SignUp(),
          SignIn.route: (context) => SignIn(),
          HomeTab.route: (context) => HomeTab(),
        },
      ),
    );
  }
}
