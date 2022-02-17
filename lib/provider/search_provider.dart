import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:watch_ltr/constants/API_KEY.dart';

import '../model/Search.dart';

class SearchProvider extends ChangeNotifier{
  bool _showLoading=false;
  bool _showSearchResults=false;
  late Search search;

  bool get showLoading => _showLoading;

  set showLoading(bool value) {
    _showLoading = value;
    notifyListeners();
  }

  bool get showSearchResults => _showSearchResults;

  set showSearchResults(bool value) {
    _showSearchResults = value;
    notifyListeners();
  }



  Future<void> getSearchResult(String query) async {
    // try {
    String url =
        'https://api.themoviedb.org/3/search/multi?api_key=${API_KEY}&language=en-US&query=${query}&page=1&include_adult=true&region=us';
    print(url);
    Response httpResponse = await get(Uri.parse(url));
    var decodeJson = jsonDecode(httpResponse.body);
    search = Search.fromJson(decodeJson);
    return;
    // } catch (e) {
    //   print(e.toString());
    // }
  }

}