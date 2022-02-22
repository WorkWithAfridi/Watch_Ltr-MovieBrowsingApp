import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:watch_ltr/constants/API_KEY.dart';
import 'package:watch_ltr/model/show_details.dart';
import 'package:watch_ltr/model/similar_movies.dart';

import '../model/RecommendedMovies.dart';
import '../model/Reviews.dart';

class ShowDetailsProvider extends ChangeNotifier {
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  late ShowDetails showDetails;
  late RecommendedMovies recommendedMovies;
  late Reviews reviews;
  late SimilarMovies similarMovies;
  ShowDetails getShow() {
    return showDetails;
  }

  Future<void> getReviews(String showID) async {
    // try {
    String url =
        'https://api.themoviedb.org/3/movie/${showID}/reviews?api_key=${API_KEY}&language=en-US&page=1';
    print(url);
    Response httpResponse = await get(Uri.parse(url));
    var decodeJson = jsonDecode(httpResponse.body);
    reviews = Reviews.fromJson(decodeJson);
    return;
    // } catch (e) {
    //   print(e.toString());
    // }
  }

  Future<void> getSimilarMovies(String showID) async {
    // try {
    String url =
        'https://api.themoviedb.org/3/movie/${showID}/similar?api_key=${API_KEY}&language=en-US&page=1';
    print(url);
    Response httpResponse = await get(Uri.parse(url));
    var decodeJson = jsonDecode(httpResponse.body);
    similarMovies = SimilarMovies.fromJson(decodeJson);
    return;
    // } catch (e) {
    //   print(e.toString());
    // }
  }

  Future<void> getShowDetails(String showID) async {
    // try {
    String url =
        'https://api.themoviedb.org/3/movie/${showID}?api_key=${API_KEY}&language=en-US';
    print(url);
    Response httpResponse = await get(Uri.parse(url));
    var decodeJson = jsonDecode(httpResponse.body);
    showDetails = ShowDetails.fromJson(decodeJson);
    return;
    // } catch (e) {
    //   print(e.toString());
    // }
  }

  Future<void> getRecommendedMovies(String showID) async {
    // try {
    String url =
        'https://api.themoviedb.org/3/movie/${showID}/recommendations?api_key=${API_KEY}&language=en-US&page=1';
    print(url);
    Response httpResponse = await get(Uri.parse(url));
    var decodeJson = jsonDecode(httpResponse.body);
    recommendedMovies = RecommendedMovies.fromJson(decodeJson);
    return;
    // } catch (e) {
    //   print(e.toString());
    // }
  }
}
