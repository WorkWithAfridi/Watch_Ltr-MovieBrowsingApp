import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watch_ltr/functions/getImageUrl.dart';
import 'package:watch_ltr/functions/openUrl.dart';
import 'package:watch_ltr/provider/show_details_provider.dart';

import '../constants/customColors.dart';
import '../constants/customTextStyle.dart';

class ShowDetails extends StatefulWidget {
  String showId;
  ShowDetails({Key? key, required this.showId}) : super(key: key);

  @override
  _ShowDetailsState createState() => _ShowDetailsState();
}

class _ShowDetailsState extends State<ShowDetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    print(widget.showId);
    ShowDetailsProvider showDetailsProvider =
        Provider.of<ShowDetailsProvider>(context, listen: false);
    await showDetailsProvider.getShowDetails(widget.showId);

    showDetailsProvider.isLoading = false;
    // await Future.delayed(
    //   Duration(seconds: 2),
    // ).then(
    //   (value) {
    //     showDetailsProvider.isLoading = false;
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ShowDetailsProvider>(
        builder: (context, provider, childProperty) {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: AppBar(
            backgroundColor: Colors.black,
          ),
        ),
        backgroundColor: black,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              provider.isLoading
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 60,
                        ),
                        Center(
                          child: CircularProgressIndicator(
                            color: red,
                          ),
                        ),
                      ],
                    )
                  : getContent(context, provider),
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
          ),
        ),
      );
    });
  }

  Container getContent(BuildContext context, ShowDetailsProvider provider) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: provider.isLoading
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 60,
                ),
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * .45,
                          width: MediaQuery.of(context).size.width,
                          child: Stack(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * .45,
                                width: MediaQuery.of(context).size.width,
                                color: black,
                                child: Image.network(
                                  getImageUrl(provider.showDetails.backdropPath
                                      .toString()),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * .45,
                                width: MediaQuery.of(context).size.width,
                                color: black.withOpacity(.3),
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * .45,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      black.withOpacity(1),
                                      black.withOpacity(.9),
                                      black.withOpacity(.6),
                                      black.withOpacity(0),
                                    ],
                                    begin: Alignment
                                        .bottomCenter, //begin of the gradient color
                                    end: Alignment
                                        .center, //end of the gradient color
                                    // stops: [0, 0.2, 0.5, 0.8],
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        provider.showDetails.title.toString(),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                        style: subTitleTS.copyWith(
                                            color: white.withOpacity(.9),
                                            fontSize: 40),
                                      ),
                                      Text(
                                        '( ${provider.showDetails.releaseDate.toString().substring(0, 4)} )',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                        style: defaultTS.copyWith(
                                          color: white.withOpacity(.6),
                                          height: .5,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 25,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: provider.showDetails.genres!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Container(
                                  width: 100,
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: white.withOpacity(.1), width: 2),
                                  ),
                                  child: Text(
                                    provider.showDetails.genres![index].name
                                        .toString(),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    textAlign: TextAlign.center,
                                    style: defaultTS.copyWith(
                                      color: white.withOpacity(.4),
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Divider(
                      height: 1,
                      color: white.withOpacity(.1),
                    ),
                  ),
                  Container(
                    height: 100,
                    // color: Colors.blue,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              size: 30,
                              color: red,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  provider.showDetails.voteAverage.toString(),
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
                            Text(
                              'Average Rating',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 6,
                              style: defaultTS.copyWith(
                                  color: white.withOpacity(.8), fontSize: 15),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '🔥',
                              style: defaultTS.copyWith(fontSize: 24),
                            ),
                            Row(
                              children: [
                                Text(
                                  provider.showDetails.voteCount.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 6,
                                  style: defaultTS.copyWith(
                                      color: white.withOpacity(1),
                                      fontSize: 25),
                                ),
                              ],
                            ),
                            Text(
                              'Vote Count',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 6,
                              style: defaultTS.copyWith(
                                  color: white.withOpacity(.8), fontSize: 15),
                            ),
                          ],
                        ),
                        // Column(
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        //   children: [
                        //     Text(
                        //       ' ',
                        //       style: defaultTS.copyWith(fontSize: 24),
                        //     ),
                        //     Icon(
                        //       Icons.bookmark,
                        //       color: white,
                        //     ),
                        //     Text(
                        //       'Bookmark',
                        //       overflow: TextOverflow.ellipsis,
                        //       maxLines: 6,
                        //       style: defaultTS.copyWith(
                        //           color: white.withOpacity(.8), fontSize: 15),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Divider(
                      height: 1,
                      color: white.withOpacity(.1),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 300,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    // color: Colors.red,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Flexible(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.all(5),
                            height: double.infinity,
                            width: double.infinity,
                            child: Image.network(
                              getImageUrl(
                                provider.showDetails.posterPath.toString(),
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            height: double.infinity,
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      provider.showDetails.title.toString(),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: titleTS.copyWith(fontSize: 25),
                                    ),
                                    Text(
                                      provider.showDetails.tagline.toString(),
                                      maxLines: 3,
                                      style: defaultTS.copyWith(
                                          color: white.withOpacity(.7),
                                          fontSize: 14),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Publishers:',
                                      maxLines: 3,
                                      style: defaultTS.copyWith(
                                          color: white.withOpacity(.7),
                                          fontSize: 14),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Container(
                                      height: 120,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        physics: BouncingScrollPhysics(),
                                        itemCount: provider.showDetails
                                            .productionCompanies!.length
                                            .toInt(),
                                        itemBuilder: (context, index) {
                                          return Container(
                                              height: 20,
                                              child: Text(
                                                '- ${provider.showDetails.productionCompanies![index].name.toString()}',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: defaultTS.copyWith(
                                                    color:
                                                        white.withOpacity(.7),
                                                    fontSize: 14),
                                              ));
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Status: ',
                                          style: defaultTS.copyWith(
                                              color: white.withOpacity(.7),
                                              fontSize: 14),
                                        ),
                                        Text(
                                          provider.showDetails.status
                                              .toString(),
                                          style: defaultTS.copyWith(
                                              color: white.withOpacity(.7),
                                              fontSize: 14),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        Navigator.of(context).pushNamed(OpenWebView.route, arguments: {'Url' : provider.showDetails.homepage.toString()});
                                      },
                                      child: Container(
                                        height: 30,
                                        width: double.infinity,
                                        color: red,
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Learn More',
                                          style: subTitleTS,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 6,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10),
                    child: Text(
                      'Storyline',
                      style: subTitleTS,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 0),
                    child: Text(
                      provider.showDetails.overview.toString(),
                      style: defaultTS.copyWith(
                        color: white.withOpacity(.5),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Divider(
                      height: 1,
                      color: white.withOpacity(.1),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
    );
  }

  Container getAppBar() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black.withOpacity(.0),
            Colors.black.withOpacity(.6),
            Colors.black.withOpacity(.8),
            Colors.black.withOpacity(1),
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 1, vertical: 5),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
                ShowDetailsProvider showDetailsProvider =
                    Provider.of<ShowDetailsProvider>(context, listen: false);
                showDetailsProvider.isLoading = true;
              },
              icon: Icon(
                Icons.arrow_back,
                color: white,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: FittedBox(
              child: Text(
                'Watch Ltr.',
                style: titleTS.copyWith(fontSize: 35, color: red),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
