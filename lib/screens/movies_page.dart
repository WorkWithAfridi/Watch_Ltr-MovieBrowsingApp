import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watch_ltr/functions/getImageUrl.dart';
import 'package:watch_ltr/model/show_details.dart';
import 'package:watch_ltr/screens/showDetails.dart';
import 'package:watch_ltr/screens/widgets/getPopularMovies.dart';
import 'package:watch_ltr/screens/widgets/getTopRatedMoviesOfAllTime.dart';
import 'package:watch_ltr/screens/widgets/getTrendingMovies.dart';
import 'package:watch_ltr/screens/widgets/getUpComingMovies.dart';

import '../constants/customColors.dart';
import '../constants/customTextStyle.dart';
import '../provider/home_provider.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  String filterForHome = 'movies';
  @override
  Widget build(BuildContext context) {
    return Container(
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
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 15),
            //   child: Divider(
            //     height: 1,
            //     color: white.withOpacity(.1),
            //   ),
            // ),
            GetPopularMovies(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Divider(
                height: 1,
                color: white.withOpacity(.1),
              ),
            ),
            GetTrendingMovies(),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Divider(
                height: 1,
                color: white.withOpacity(.1),
              ),
            ),
            GetUpComingMovies(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Divider(
                height: 1,
                color: white.withOpacity(.1),
              ),
            ),
            GetTopRatedMovies(),
          ],
        ),
      ),
    );
  }

  Widget getBannerForHome(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, provider, childproperty) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ShowDetailsPage(
                showId: provider.trendingMovies.results![0].id.toString(),
              ),
            ),
          );
        },
        child: Container(
          height: MediaQuery.of(context).size.height * .85,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .85,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  getImageUrl(
                    provider.trendingMovies.results![0].posterPath.toString(),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * .85,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.red,
                  gradient: LinearGradient(
                    colors: [
                      black.withOpacity(.8),
                      black.withOpacity(.25),
                      black.withOpacity(.0),
                      black.withOpacity(.0),
                    ],
                    begin: Alignment.centerLeft, //begin of the gradient color
                    end: Alignment.centerRight, //end of the gradient color
                    // stops: [0, 0.2, 0.5, 0.8],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * .85,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.red,
                  gradient: LinearGradient(
                    colors: [
                      black.withOpacity(0),
                      black.withOpacity(.6),
                      black.withOpacity(.8),
                      black.withOpacity(1),
                    ],
                    begin: Alignment.center, //begin of the gradient color
                    end: Alignment.bottomCenter, //end of the gradient color
                    // stops: [0, 0.2, 0.5, 0.8],
                  ),
                ),
              ),
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * .85,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 75, right: 15),
                          child: FittedBox(
                            child: Text(
                              provider.trendingMovies.results![0].title
                                  .toString(),
                              style: TitleTS,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 75, right: 15),
                          child: Text(
                            '      ${provider.trendingMovies.results![0].overview.toString()}',
                            // overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            textAlign: TextAlign.end,
                            style: defaultTS,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * .85,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.centerLeft,
                    child: getFilterForHome(context),
                  )
                ],
              ),
            ],
          ),
        ),
      );
    });
  }

  Container getFilterForHome(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 17),
      alignment: Alignment.centerLeft,
      child: RotatedBox(
        quarterTurns: 3,
        child: Container(
          width: MediaQuery.of(context).size.width - 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Consumer<HomeProvider>(
                  builder: (context, provider, childProperty) {
                return GestureDetector(
                  onTap: () {
                    provider.pageController.animateToPage(0,
                        duration: Duration(seconds: 1),
                        curve: Curves.linearToEaseOut);
                  },
                  child: Text(
                    'TV Shows',
                    style: TitleTS.copyWith(
                        fontSize: 18,
                        wordSpacing: 1,
                        letterSpacing: 1,
                        color:
                            filterForHome == 'tv_shows' ? red : Colors.white),
                  ),
                );
              }),
              Consumer<HomeProvider>(
                  builder: (context, provider, childProperty) {
                return GestureDetector(
                  onTap: () {
                    provider.pageController.animateToPage(1,
                        duration: Duration(seconds: 1),
                        curve: Curves.linearToEaseOut);
                  },
                  child: Text(
                    'Movies',
                    style: TitleTS.copyWith(
                        fontSize: 18,
                        wordSpacing: 1,
                        letterSpacing: 1,
                        color: filterForHome == 'movies' ? red : Colors.white),
                  ),
                );
              }),
              Consumer<HomeProvider>(
                  builder: (context, provider, childProperty) {
                return GestureDetector(
                  onTap: () {
                    provider.pageController.animateToPage(2,
                        duration: Duration(seconds: 2),
                        curve: Curves.linearToEaseOut);
                  },
                  child: Row(
                    children: [
                      Text(
                        'Watch list',
                        style: TitleTS.copyWith(
                            fontSize: 18,
                            wordSpacing: 1,
                            letterSpacing: 1,
                            color: filterForHome == 'my_list'
                                ? red
                                : Colors.white),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
