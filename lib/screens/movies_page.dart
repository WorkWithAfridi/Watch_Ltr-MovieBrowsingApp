import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watch_ltr/functions/getImageUrl.dart';
import 'package:watch_ltr/screens/widgets/getPopularMovies.dart';
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
            GetPopularMovies(),
            GetTrendingMovies(),
            GetUpComingMovies(),
          ],
        ),
      ),
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
                getImageUrl(
                  provider.trendingMovies.results![0].posterPath.toString(),
                ),
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
              height: MediaQuery.of(context).size.height,
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
                    child: Text(
                      '      ${provider.trendingMovies.results![0].overview.toString()}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: defaultTS.copyWith(
                          color: white.withOpacity(.7), fontSize: 14),
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
}
