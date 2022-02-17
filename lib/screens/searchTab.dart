import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watch_ltr/provider/search_provider.dart';
import 'package:watch_ltr/screens/widgets/customSearchField.dart';
import 'package:watch_ltr/screens/widgets/getSearchedShows.dart';
import 'package:watch_ltr/screens/widgets/getTrendingMovies.dart';

import '../constants/customColors.dart';
import '../provider/home_provider.dart';
import '../provider/search_provider.dart';
import '../provider/search_provider.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({Key? key}) : super(key: key);

  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  TextEditingController searchTextEditingController = TextEditingController();

  void getData() async {
    SearchProvider searchProvider =
        Provider.of<SearchProvider>(context, listen: false);
    searchProvider.showSearchResults = false;
    searchProvider.showLoading = false;
    HomeProvider homeProvider =
        Provider.of<HomeProvider>(context, listen: false);
    homeProvider.isLoading = true;
    await homeProvider.getTrendingMovies();
    // await Future.delayed(Duration(seconds: 3));
    homeProvider.isLoading = false;
    // ScaffoldMessenger.of(context)
    //     .showSnackBar(SnackBar(content: Text('UI Update')));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    SearchProvider searchProvider =
        Provider.of<SearchProvider>(context, listen: false);
    HomeProvider homeProvider =
        Provider.of<HomeProvider>(context, listen: false);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            SizedBox.expand(
              child: Image.asset(
                'assets/background_search.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: black.withOpacity(.95),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomSearchField(
                            textEditingController: searchTextEditingController,
                            hintText: 'Search...',
                            textInputType: TextInputType.text,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 40,
                          child: IconButton(
                            onPressed: () {
                              if (searchTextEditingController.text.isNotEmpty) {
                                SearchProvider searchProvider =
                                    Provider.of<SearchProvider>(context,
                                        listen: false);
                                searchProvider.showSearchResults = true;
                                searchProvider.showLoading = true;

                                searchProvider.getSearchResult(
                                    searchTextEditingController.text);

                                Future.delayed(Duration(seconds: 1))
                                    .then((value) {
                                  searchProvider.showLoading = false;
                                  print('done searching');
                                });
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    backgroundColor: red,
                                    duration: Duration(seconds: 2),
                                    content: Text(
                                        'Please input a correct parameter'),
                                  ),
                                );
                              }
                            },
                            splashColor: black,
                            icon: Icon(
                              Icons.search,
                              color: white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Consumer<SearchProvider>(
                      builder: (context, searchProv, childProperty) {
                        return searchProv.showSearchResults
                            ? (searchProv.showLoading
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CircularProgressIndicator(
                                        color: red,
                                      ),
                                    ],
                                  )
                                : SingleChildScrollView(
                                    physics: BouncingScrollPhysics(),
                                    child: Column(
                                      children: [
                                        GetSearchedShows(),
                                      ],
                                    ),
                                  ))
                            : Consumer<HomeProvider>(
                                builder:
                                    (context, homeProv, childPropertyForHome) {
                                  return homeProv.isLoading
                                      ? Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Center(
                                              child: CircularProgressIndicator(
                                                color: red,
                                              ),
                                            ),
                                          ],
                                        )
                                      : SingleChildScrollView(
                                          physics: BouncingScrollPhysics(),
                                          child: Column(
                                            children: [
                                              GetTrendingMovies(),
                                            ],
                                          ),
                                        );
                                },
                              );
                      },
                    ),
                  ),

                  // searchProvider.showSearchResults
                  //     ? (searchProvider.showLoading
                  //         ? Center(
                  //             child: CircularProgressIndicator(
                  //               color: red,
                  //             ),
                  //           )
                  //         : SingleChildScrollView(
                  //             physics: BouncingScrollPhysics(),
                  //             child: Column(
                  //               children: [
                  //                 Padding(
                  //                   padding: const EdgeInsets.symmetric(
                  //                       horizontal: 15),
                  //                   child: Divider(
                  //                     height: 1,
                  //                     color: white.withOpacity(.1),
                  //                   ),
                  //                 ),
                  //                 GetTrendingMovies(),
                  //                 SizedBox(height: 15),
                  //               ],
                  //             ),
                  //           ))
                  //     : (homeProvider.isLoading
                  //         ? Center(
                  //             child: CircularProgressIndicator(
                  //               color: red,
                  //             ),
                  //           )
                  //         : SingleChildScrollView(
                  //             physics: BouncingScrollPhysics(),
                  //             child: Column(
                  //               children: [
                  //                 Padding(
                  //                   padding: const EdgeInsets.symmetric(
                  //                       horizontal: 15),
                  //                   child: Divider(
                  //                     height: 1,
                  //                     color: white.withOpacity(.1),
                  //                   ),
                  //                 ),
                  //                 GetTrendingMovies(),
                  //                 SizedBox(height: 15),
                  //               ],
                  //             ),
                  //           )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
