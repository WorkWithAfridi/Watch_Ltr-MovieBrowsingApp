import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:watch_ltr/constants/customTextStyle.dart';
import 'package:watch_ltr/provider/home_provider.dart';
import 'package:watch_ltr/screens/movies_page.dart';
import 'package:watch_ltr/widgets/CustomFont.dart';

import '../constants/customColors.dart';

class Home extends StatefulWidget {
  static const route = '/Home';
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  String filterForHome = 'movies';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    HomeProvider homeProvider =
        Provider.of<HomeProvider>(context, listen: false);
    await homeProvider.getTrendingMovies();
    await homeProvider.getPlayingNowMovies();
    await homeProvider.getUpcomingMovies();
    homeProvider.isLoading = false;
  }

  GlobalKey<ScaffoldState> scaffoldStateKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.black,
        ),
      ),
      key: scaffoldStateKey,
      drawer: Drawer(
        backgroundColor: red,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(
                child: Container(
                    // color: Colors.blue,
                    ),
              ),
              InkWell(
                onTap: () async {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: 45,
                  child: Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.signOutAlt,
                        color: black,
                        size: 22,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text('Sign Out', style: defaultTS.copyWith(color: black))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: black,
      body: Consumer<HomeProvider>(builder: (context, provider, childProperty) {
        return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                provider.isLoading
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 60,
                          ),
                          Center(
                            child: CircularProgressIndicator(
                              color: red,
                            ),
                          ),
                        ],
                      )
                    : MoviesPage(),
                Container(
                  height: MediaQuery.of(context).size.height,
                  // color: Colors.pink,
                  child: Column(
                    children: [
                      getAppBar(),
                    ],
                  ),
                ),
              ],
            ));
      }),
      bottomNavigationBar: getBottomNavigationBar(),
    );
  }

  Container getAppBar() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black.withOpacity(.0),
            Colors.black.withOpacity(.6),
            Colors.black.withOpacity(.8),
            Colors.black.withOpacity(1),
            //add more colors for gradient
          ],
          begin: Alignment.bottomCenter, //begin of the gradient color
          end: Alignment.topCenter, //end of the gradient color
          // stops: [0, 0.2, 0.5, 0.8] //stops for individual color
          //set the stops number equal to numbers of color
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 1, vertical: 5),
            child: IconButton(
              onPressed: () {
                scaffoldStateKey.currentState!.openDrawer();
              },
              icon: Icon(
                Icons.menu,
                color: white,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: FittedBox(
              child: Text(
                'Watch Ltr.',
                style: titleTS.copyWith(fontSize: 35, color: red),
              ),
            ),
          ),
        ],
      ),
    );
  }

  BottomNavigationBar getBottomNavigationBar() {
    return BottomNavigationBar(
      // showSelectedLabels: false,
      // showUnselectedLabels: false,
      backgroundColor: red,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: white.withOpacity(.9),
      unselectedItemColor: black.withOpacity(.7),
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 27,
          ),
          label: 'HOME',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search, size: 27),
          label: 'SEARCH',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark, size: 27),
          label: 'BOOKMARKS',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, size: 27),
          label: 'PROFILE',
        ),
      ],
    );
  }
}
