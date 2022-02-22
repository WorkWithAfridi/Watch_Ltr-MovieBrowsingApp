import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:watch_ltr/constants/customTextStyle.dart';
import 'package:watch_ltr/provider/home_provider.dart';
import 'package:watch_ltr/screens/movies_page.dart';
import 'package:watch_ltr/screens/searchTab.dart';
import 'package:watch_ltr/screens/watchList_page.dart';
import 'package:watch_ltr/screens/widgets/getPopularMovies.dart';
import 'package:watch_ltr/screens/widgets/getTrendingMovies.dart';
import 'package:watch_ltr/screens/widgets/getUpComingMovies.dart';

import '../constants/customColors.dart';
import '../functions/getImageUrl.dart';

class HomeTab extends StatefulWidget {
  static const route = '/Home';
  const HomeTab({Key? key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
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
    await homeProvider.getTopRatedMoviesOfAllTime();
    // await Future.delayed(Duration(seconds: 3));
    homeProvider.isLoading = false;
    // ScaffoldMessenger.of(context)
    //     .showSnackBar(SnackBar(content: Text('UI Update')));
  }

  GlobalKey<ScaffoldState> scaffoldStateKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    List<Widget> Screens = [
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Consumer<HomeProvider>(
          builder: (context, provider, childProperty) {
            return Stack(
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
                    : Consumer<HomeProvider>(
                        builder: (context, provider, childProperty) {
                        return Container(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            child: PageView(
                              controller: provider.pageController,
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.red,
                                ),
                                MoviesPage(),
                                WatchListPage()
                              ],
                            ));
                      }),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    // height: 50,
                    // color: Colors.pink,
                    child: getAppBar(),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [SearchTab(), getAppBar()],
        ),
      ),
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: black,
        child: Stack(
          children: [WatchListPage(), getAppBar()],
        ),
      ),
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: white,
      ),
    ];

    HomeProvider homeProvider =
        Provider.of<HomeProvider>(context, listen: false);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.black,
        ),
      ),
      key: scaffoldStateKey,
      drawer: Drawer(
        backgroundColor: black,
        child: Stack(
          children: [
            SizedBox.expand(
              child: Image.asset(
                'assets/drawer_background_img.jpg',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox.expand(
              child: Container(
                color: red.withOpacity(.90),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * .15,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'X',
                      style: TextStyle(
                        fontFamily: 'sans-serif',
                        fontWeight: FontWeight.w500,
                        color: white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);

                              setState(() {
                                currentIndex = 0;
                              });
                              homeProvider.pageController.animateToPage(1,
                                  duration: Duration(seconds: 1),
                                  curve: Curves.linear);
                            },
                            child: Text(
                              'Home',
                              style:
                                  TitleTS.copyWith(fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);

                              setState(() {
                                currentIndex = 0;
                              });
                              homeProvider.pageController.animateToPage(1,
                                  duration: Duration(seconds: 1),
                                  curve: Curves.linear);
                            },

                            child: Text(
                              'Movies',
                              style:
                                  TitleTS.copyWith(fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);

                              setState(() {
                                currentIndex = 0;
                              });
                              homeProvider.pageController.animateToPage(0,
                                  duration: Duration(seconds: 1),
                                  curve: Curves.linear);
                            },
                            child: Text(
                              'TV SHow',
                              style:
                                  TitleTS.copyWith(fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              setState(() {
                                currentIndex = 2;
                              });
                            },
                            child: Text(
                              'Watch list',
                              style:
                                  TitleTS.copyWith(fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: (){

                              Navigator.pop(context);
                              setState(() {
                                currentIndex = 1;
                              });
                            },
                            child: Text(
                              'Search',
                              style:
                                  TitleTS.copyWith(fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              setState(() {
                                currentIndex = 3;
                              });
                            },
                            child: Text(
                              'My Account',
                              style:
                                  TitleTS.copyWith(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
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
                      child: Text(
                        'Log Out',
                        style: TitleTS.copyWith(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: black,
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              'assets/background_img_for_homepage.jpg',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox.expand(
            child: Container(
              color: black.withOpacity(.96),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: PageView.builder(
              itemCount: 4,
              physics: NeverScrollableScrollPhysics(),
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              itemBuilder: (context, index) {
                return Screens[currentIndex];
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: getBottomNavigationBar(),
    );
  }

  Container getAppBar() {
    return Container(
      width: MediaQuery.of(context).size.width,
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
                style: TitleTS.copyWith(color: red),
              ),
            ),
          ),
        ],
      ),
    );
  }

  BottomNavigationBar getBottomNavigationBar() {
    HomeProvider homeProvider =
        Provider.of<HomeProvider>(context, listen: false);
    return BottomNavigationBar(
      // showSelectedLabels: false,
      // showUnselectedLabels: false,
      backgroundColor: red,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: white.withOpacity(.9),
      unselectedItemColor: black.withOpacity(.7),
      currentIndex: currentIndex,
      onTap: (index) {
        if (index == 0) {
          setState(() {
            currentIndex = index;
          });
          homeProvider.pageController.animateToPage(1,
              duration: Duration(seconds: 1), curve: Curves.linear);
        }
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
          icon: Icon(Icons.remove_red_eye, size: 27),
          label: 'WATCH LIST',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, size: 27),
          label: 'PROFILE',
        ),
      ],
    );
  }
}
