import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:watch_ltr/constants/API_KEY.dart';
import 'package:watch_ltr/model/playing_now_,movies.dart';
import 'package:watch_ltr/model/top_rated_movies_of_all_time.dart';
import 'package:watch_ltr/model/trending_now_movies.dart';
import 'package:watch_ltr/model/upcoming_movies.dart';

class HomeProvider extends ChangeNotifier {
  late TrendingNowMovies trendingMovies;
  late PlayingNowMovies playingNowMovies;
  late UpcomingMovies upcomingMovies;
  late TopRatedMoviesOfAllTime topRatedMoviesOfAllTime;
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> getTrendingMovies() async {
    // try {
      String url =
          'https://api.themoviedb.org/3/movie/popular?api_key=${API_KEY}&language=en-US&page=1&region=us';
      Response httpResponse = await get(Uri.parse(url));
      var decodeJson = jsonDecode(httpResponse.body);
      trendingMovies = TrendingNowMovies.fromJson(decodeJson);
      return;
    // } catch (e) {
    //   print(e.toString());
    // }
  }
  Future<void> getTopRatedMoviesOfAllTime() async {
    // try {
      String url =
          'https://api.themoviedb.org/3/movie/top_rated?api_key=${API_KEY}&language=en-US&page=1&region=us';
      Response httpResponse = await get(Uri.parse(url));
      var decodeJson = jsonDecode(httpResponse.body);
      topRatedMoviesOfAllTime = TopRatedMoviesOfAllTime.fromJson(decodeJson);
      return;
    // } catch (e) {
    //   print(e.toString());
    // }
  }

  Future<void> getPlayingNowMovies() async {
    // try {
      String url =
          'https://api.themoviedb.org/3/movie/now_playing?api_key=${API_KEY}&language=en-US&page=1&region=us';
      Response httpResponse = await get(Uri.parse(url));
      var decodeJson = jsonDecode(httpResponse.body);
      playingNowMovies = PlayingNowMovies.fromJson(decodeJson);
      return;
    // } catch (e) {
    //   print(e.toString());
    // }
  }

  Future<void> getUpcomingMovies() async {
    // try {
      String url =
          'https://api.themoviedb.org/3/movie/upcoming?api_key=${API_KEY}&language=en-US&page=1&region=us';
      Response httpResponse = await get(Uri.parse(url));
      var decodeJson = jsonDecode(httpResponse.body);
      upcomingMovies = UpcomingMovies.fromJson(decodeJson);
      return;
    // } catch (e) {
    //   print(e.toString());
    // }
  }
}
