import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watch_ltr/functions/getImageUrl.dart';

import '../../constants/customColors.dart';
import '../../constants/customTextStyle.dart';
import '../../provider/home_provider.dart';
import '../showDetails.dart';

class GetTrendingMovies extends StatelessWidget {
  const GetTrendingMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  style: TitleTS.copyWith(color: red),
                ),
                Container(
                  color: red,
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(
                    'SEE MORE',
                    style: defaultTS.copyWith(
                        color: white,
                        fontSize: 14,
                        fontWeight: FontWeight.w900),
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
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ShowDetails(
                            showId: provider.trendingMovies.results![index].id
                                .toString(),
                          ),
                        ),
                      );
                    },
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
                                  getImageUrl(provider
                                      .trendingMovies.results![index].posterPath
                                      .toString()),
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
                                    Text(
                                      provider
                                          .trendingMovies.results![index].title
                                          .toString(),
                                      overflow: TextOverflow.ellipsis,
                                      style: TitleTS,
                                    ),
                                    Text(
                                      'Released On: ${provider.trendingMovies.results![index].releaseDate.toString()}',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: defaultTS.copyWith(
                                          color: white.withOpacity(.5)),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                        provider.trendingMovies.results![index]
                                            .overview
                                            .toString(),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 6,
                                        style: defaultTS),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: red,
                                          size: 35,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '${provider.trendingMovies.results![index].voteAverage.toString()}',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 6,
                                          style: defaultTS.copyWith(
                                              color: white.withOpacity(1),
                                              fontSize: 25),
                                        ),
                                        Text(
                                          ' /10',
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
                  ),
                );
              },
            ),
          ),
        ],
      );
    });
  }
}
