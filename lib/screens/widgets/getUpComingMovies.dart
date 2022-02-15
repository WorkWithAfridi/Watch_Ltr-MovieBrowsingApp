import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watch_ltr/functions/getImageUrl.dart';

import '../../constants/customColors.dart';
import '../../constants/customTextStyle.dart';
import '../../provider/home_provider.dart';
import '../showDetails.dart';

class GetUpComingMovies extends StatelessWidget {
  const GetUpComingMovies({Key? key}) : super(key: key);

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
            height: 430,
            // width: 200,
            child: ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: provider.upcomingMovies.results!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: index == provider.upcomingMovies.results!.length
                      ? EdgeInsets.only(left: 15, right: 15)
                      : EdgeInsets.only(left: 15),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ShowDetails(
                            showId: provider
                                .upcomingMovies.results![index].id
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
                                  .upcomingMovies.results![index].posterPath
                                  .toString()),
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
                            style: subTitleTS.copyWith(
                                color: white.withOpacity(.9), fontSize: 30),
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
                                color: white.withOpacity(.7), fontSize: 14),
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
