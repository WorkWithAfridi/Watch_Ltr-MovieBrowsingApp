import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watch_ltr/functions/getImageUrl.dart';
import 'package:watch_ltr/screens/showDetails.dart';

import '../../constants/customColors.dart';
import '../../constants/customTextStyle.dart';
import '../../provider/home_provider.dart';

class GetPopularMovies extends StatelessWidget {
  const GetPopularMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            height: 510,
            // width: 200,
            child: ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: provider.playingNowMovies.results!.length - 1,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      index == provider.playingNowMovies.results!.length - 2
                          ? EdgeInsets.only(left: 15, right: 15)
                          : EdgeInsets.only(left: 15),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ShowDetailsPage(
                            showId: provider.playingNowMovies.results![index].id
                                .toString(),
                          ),
                        ),
                      );
                    },
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
                              getImageUrl(
                                provider
                                    .playingNowMovies.results![index].posterPath
                                    .toString(),
                              ),
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
                            style: TitleTS,
                          ),
                          Text(
                            'Released On: ${provider.playingNowMovies.results![index].releaseDate.toString()}',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: defaultTS.copyWith(color: white.withOpacity(.5)),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            provider.playingNowMovies.results![index].overview
                                .toString(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: defaultTS
                          ),
                        ],
                      ),
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
}
