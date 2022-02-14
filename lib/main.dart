import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watch_ltr/constants/customColors.dart';
import 'package:watch_ltr/provider/home_provider.dart';
import 'package:watch_ltr/screens/home.dart';
import 'package:watch_ltr/screens/onBoarding.dart';

void main() {
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
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: black,
          ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: OnBoarding.route,
        routes: {
          OnBoarding.route: (context) => OnBoarding(),
          Home.route: (context) => Home(),
        },
      ),
    );
  }
}
