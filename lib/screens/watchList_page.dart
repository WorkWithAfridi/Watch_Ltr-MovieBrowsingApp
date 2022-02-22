import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watch_ltr/constants/customTextStyle.dart';
import 'package:watch_ltr/functions/getImageUrl.dart';
import 'package:watch_ltr/model/show_details.dart';
import 'package:watch_ltr/provider/userProvider.dart';
import 'package:watch_ltr/screens/showDetails.dart';

import '../constants/customColors.dart';
import '../provider/show_details_provider.dart';

class WatchListPage extends StatefulWidget {
  const WatchListPage({Key? key}) : super(key: key);

  @override
  _WatchListPageState createState() => _WatchListPageState();
}

class _WatchListPageState extends State<WatchListPage> {
  void getData() async {
    setState(() {
      isLoading = true;
    });
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    await userProvider.refreshUser();
    List watchList = userProvider.getUserModel.watchLaterList;

    ShowDetailsProvider showDetailsProvider =
        Provider.of<ShowDetailsProvider>(context, listen: false);
    print(watchList);
    for (int i = 0; i < watchList.length; i++) {
      await showDetailsProvider.getShowDetails(watchList[i]);
      watchLaterShows.add(showDetailsProvider.getShow());
    }
    print(watchList);
    setState(() {
      isLoading = false;
    });
  }

  bool isLoading = false;

  late List<ShowDetails> watchLaterShows = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.blue,
      child: Stack(
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
          isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: red,
                  ),
                )
              : Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 55,
                        ),
                        Text(
                          'You watchlist',
                          style: TitleTS.copyWith(color: red),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        watchLaterShows.isEmpty
                            ? Text(
                                "You don't have any shows listed under your watchlist. :(",
                                style: defaultTS,
                              )
                            : ListView.builder(
                                itemCount: watchLaterShows.length,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: (){
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => ShowDetailsPage(
                                            showId: watchLaterShows[index].id.toString(),
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: 400,
                                      // color: Colors.pink,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              height: double.infinity,
                                              width: double.infinity,
                                              child: Image.network(
                                                getImageUrl(watchLaterShows[index]
                                                    .posterPath
                                                    .toString()),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 110,
                                            // color: Colors.red,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  watchLaterShows[index]
                                                      .title
                                                      .toString(),
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TitleTS,
                                                ),
                                                Text(
                                                  'Release Date: ${watchLaterShows[index].releaseDate.toString()}',
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                  style: defaultTS.copyWith(
                                                      color:
                                                          white.withOpacity(.5)),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                    watchLaterShows[index]
                                                        .overview
                                                        .toString(),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                    style: defaultTS),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              )
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
