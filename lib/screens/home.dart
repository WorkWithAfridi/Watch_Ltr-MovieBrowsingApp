import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watch_ltr/constants/customTextStyle.dart';
import 'package:watch_ltr/provider/home_provider.dart';
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
    homeProvider.isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.black,
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
                    ? Center(
                        child: CircularProgressIndicator(
                          color: red,
                        ),
                      )
                    : Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        // color: Colors.pink,
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              getBannerForHome(context),
                              getTrendingNowListForHome(context),
                              getPlayingNowListForHome(context),
                            ],
                          ),
                        ),
                      ),
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

  Widget getBannerForHome(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, provider, childproperty) {
      return Container(
        height: MediaQuery.of(context).size.height * .65,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                'https://image.tmdb.org/t/p/w500${provider.trendingMovies.results![0].backdropPath.toString()}',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.red,
                gradient: LinearGradient(
                  colors: [
                    black.withOpacity(1),
                    black.withOpacity(.25),
                    black.withOpacity(.4),
                    black.withOpacity(.9),
                  ],
                  begin: Alignment.centerLeft, //begin of the gradient color
                  end: Alignment.centerRight, //end of the gradient color
                  // stops: [0, 0.2, 0.5, 0.8],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.red,
                gradient: LinearGradient(
                  colors: [
                    black.withOpacity(0),
                    black.withOpacity(.0),
                    black.withOpacity(0),
                    black.withOpacity(1),
                  ],
                  begin: Alignment.center, //begin of the gradient color
                  end: Alignment.bottomCenter, //end of the gradient color
                  // stops: [0, 0.2, 0.5, 0.8],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  getFilterForHome(context),
                  Padding(
                    padding: const EdgeInsets.only(left: 75, right: 15),
                    child: FittedBox(
                      child: Text(
                        provider.trendingMovies.results![0].title.toString(),
                        style: subTitleTS.copyWith(fontSize: 40),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 75, right: 15),
                    child: FittedBox(
                      child: Text(
                        'Released on: ${provider.trendingMovies.results![0].releaseDate.toString()}',
                        style: defaultTS.copyWith(
                            color: Colors.white.withOpacity(.6)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget getTrendingNowListForHome(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, provider, childProperty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Popular',
                  style: subTitleTS.copyWith(color: white.withOpacity(.5)),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 330,
            // width: 200,
            child: ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: provider.trendingMovies.results!.length - 1,
              itemBuilder: (context, index) {
                return Padding(
                  padding: index == provider.trendingMovies.results!.length - 2
                      ? EdgeInsets.only(left: 20, right: 20)
                      : EdgeInsets.only(left: 20),
                  child: Container(
                    width: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 300,
                          color: black,
                          width: 200,
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w500${provider.trendingMovies.results![index + 1].posterPath.toString()}',
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          provider.trendingMovies.results![index + 1].title
                              .toString(),
                          overflow: TextOverflow.ellipsis,
                          style:
                              defaultTS.copyWith(color: white.withOpacity(.5)),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 25,
          )
        ],
      );
    });
  }

  Widget getPlayingNowListForHome(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, provider, childProperty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Trending',
                  style: subTitleTS.copyWith(color: white.withOpacity(.5)),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 330,
            // width: 200,
            child: ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: provider.playingNowMovies.results!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: index == provider.playingNowMovies.results!.length
                      ? EdgeInsets.only(left: 20, right: 20)
                      : EdgeInsets.only(left: 20),
                  child: Container(
                    width: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 300,
                          color: black,
                          width: 200,
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w500${provider.playingNowMovies.results![index].posterPath.toString()}',
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          provider.playingNowMovies.results![index].title
                              .toString(),
                          overflow: TextOverflow.ellipsis,
                          style:
                              defaultTS.copyWith(color: white.withOpacity(.5)),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      );
    });
  }

  Container getFilterForHome(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 17),
      alignment: Alignment.topLeft,
      child: RotatedBox(
        quarterTurns: 3,
        child: Container(
          width: MediaQuery.of(context).size.width - 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    filterForHome = 'tv_shows';
                  });
                },
                child: Text(
                  'TV Shows',
                  style: subTitleTS.copyWith(
                      fontSize: 18,
                      wordSpacing: 1,
                      letterSpacing: 1,
                      color: filterForHome == 'tv_shows' ? red : Colors.white),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    filterForHome = 'movies';
                  });
                },
                child: Text(
                  'Movies',
                  style: subTitleTS.copyWith(
                      fontSize: 18,
                      wordSpacing: 1,
                      letterSpacing: 1,
                      color: filterForHome == 'movies' ? red : Colors.white),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    filterForHome = 'my_list';
                  });
                },
                child: Text(
                  'My List',
                  style: subTitleTS.copyWith(
                      fontSize: 18,
                      wordSpacing: 1,
                      letterSpacing: 1,
                      color: filterForHome == 'my_list' ? red : Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container getAppBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      height: 60,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black.withOpacity(.0),
            Colors.black.withOpacity(.4),
            Colors.black.withOpacity(.6),
            Colors.black.withOpacity(.9),
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
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              color: white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: FittedBox(
              child: Text(
                'Watch Ltr.',
                style: titleTS.copyWith(fontSize: 35),
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
