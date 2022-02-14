import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            getPopularListForHome(context),
            getTrendingListForHome(context),
            getUpcomingListForHome(context),
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
                'https://image.tmdb.org/t/p/w500${provider.trendingMovies.results![0].posterPath.toString()}',
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
                          color: white.withOpacity(.6), fontSize: 14),
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

  Widget getPopularListForHome(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, provider, childProperty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Popular',
                  style: subTitleTS.copyWith(color: white.withOpacity(.7)),
                ),
                Container(
                  color: red,
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(
                    'SEE MORE',
                    style: defaultTS.copyWith(
                        color: white.withOpacity(.9),
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 510,
            // width: 200,
            child: ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: provider.trendingMovies.results!.length - 1,
              itemBuilder: (context, index) {
                return Padding(
                  padding: index == provider.trendingMovies.results!.length - 2
                      ? EdgeInsets.only(left: 15, right: 15)
                      : EdgeInsets.only(left: 15),
                  child: Container(
                    width: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 410,
                          color: black,
                          width: 300,
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
                          style: subTitleTS.copyWith(
                              color: white.withOpacity(.9), fontSize: 30),
                        ),
                        Text(
                          'Released On: ${provider.trendingMovies.results![index].releaseDate.toString()}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: defaultTS.copyWith(
                              color: white.withOpacity(.6), fontSize: 12),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          provider.trendingMovies.results![index].overview
                              .toString(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: defaultTS.copyWith(
                              color: white.withOpacity(.6), fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 15,
          )
        ],
      );
    });
  }

  Widget getTrendingListForHome(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, provider, childProperty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Trending - TOP 10',
                  style: subTitleTS.copyWith(color: white.withOpacity(.7)),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  color: red,
                  child: Text(
                    'SEE MORE',
                    style: defaultTS.copyWith(
                        color: white.withOpacity(.9),
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            // color: Colors.blue,
            // height: 330,
            // width: 200,
            child: ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 15, right: 0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 2,
                            child: Container(
                              height: 300,
                              color: black,
                              width: 200,
                              child: Image.network(
                                'https://image.tmdb.org/t/p/w500${provider.playingNowMovies.results![index].posterPath.toString()}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            flex: 2,
                            child: Container(
                              padding: EdgeInsets.only(right: 15),
                              height: 300,
                              color: black,
                              width: 200,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  FittedBox(
                                    child: Text(
                                      provider.playingNowMovies.results![index]
                                          .title
                                          .toString(),
                                      overflow: TextOverflow.ellipsis,
                                      style: subTitleTS.copyWith(
                                          color: white.withOpacity(.9),
                                          fontSize: 30),
                                    ),
                                  ),
                                  Text(
                                    'Released On: ${provider.trendingMovies.results![index].releaseDate.toString()}',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: defaultTS.copyWith(
                                        color: white.withOpacity(.6),
                                        fontSize: 12),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    provider.playingNowMovies.results![index]
                                        .overview
                                        .toString(),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 6,
                                    style: defaultTS.copyWith(
                                        color: white.withOpacity(.6),
                                        fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: red,
                                        size: 35,
                                      ),
                                      Text(
                                        '${provider.playingNowMovies.results![index].voteAverage.toString()}',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 6,
                                        style: defaultTS.copyWith(
                                            color: white.withOpacity(1),
                                            fontSize: 25),
                                      ),
                                      Text(
                                        '/10',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 6,
                                        style: defaultTS.copyWith(
                                            color: white.withOpacity(.6),
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      );
    });
  }

  Widget getUpcomingListForHome(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, provider, childProperty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'COMING SOON',
                  style: subTitleTS.copyWith(color: white.withOpacity(.7)),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  color: red,
                  child: Text(
                    'SEE MORE',
                    style: defaultTS.copyWith(
                        color: white.withOpacity(.9),
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 410,
            // width: 200,
            child: ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: provider.upcomingMovies.results!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: index == provider.playingNowMovies.results!.length
                      ? EdgeInsets.only(left: 15, right: 15)
                      : EdgeInsets.only(left: 15),
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
                            'https://image.tmdb.org/t/p/w500${provider.upcomingMovies.results![index].posterPath.toString()}',
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          provider.upcomingMovies.results![index].title
                              .toString(),
                          overflow: TextOverflow.ellipsis,
                          style:
                          defaultTS.copyWith(color: white.withOpacity(.5)),
                        ),
                        Text(
                          'Release Date: ${provider.upcomingMovies.results![index].releaseDate.toString()}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: defaultTS.copyWith(
                              color: white.withOpacity(.6), fontSize: 12),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          provider.upcomingMovies.results![index].overview
                              .toString(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: defaultTS.copyWith(
                              color: white.withOpacity(.6), fontSize: 14),
                        ),
                        SizedBox(
                          height: 10,
                        ),
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

}
