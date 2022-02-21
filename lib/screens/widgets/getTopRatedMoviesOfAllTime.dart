import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watch_ltr/functions/getImageUrl.dart';

import '../../constants/customColors.dart';
import '../../constants/customTextStyle.dart';
import '../../provider/home_provider.dart';
import '../showDetails.dart';

class GetTopRatedMovies extends StatelessWidget {
  const GetTopRatedMovies({Key? key}) : super(key: key);

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
                  'TOP RATED',
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
            width: MediaQuery.of(context).size.width,
            height: 430,
            // width: 200,
            child: ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: provider.topRatedMoviesOfAllTime.results!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: index == provider.topRatedMoviesOfAllTime.results!.length
                      ? EdgeInsets.only(left: 15, right: 15)
                      : EdgeInsets.only(left: 15),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ShowDetailsPage(
                            showId: provider
                                .topRatedMoviesOfAllTime.results![index].id
                                .toString(),
                          ),
                        ),
                      );
                    },
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
                              getImageUrl(provider
                                  .topRatedMoviesOfAllTime.results![index].posterPath
                                  .toString()),
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            provider.topRatedMoviesOfAllTime.results![index].title
                                .toString(),
                            overflow: TextOverflow.ellipsis,
                            style: TitleTS,
                          ),
                          Text(
                            'Release Date: ${provider.topRatedMoviesOfAllTime.results![index].releaseDate.toString()}',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: defaultTS.copyWith(color: white.withOpacity(.5)),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                              provider.topRatedMoviesOfAllTime.results![index].overview
                                  .toString(),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: defaultTS
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
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
