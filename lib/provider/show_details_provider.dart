import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:watch_ltr/constants/API_KEY.dart';
import 'package:watch_ltr/model/show_details.dart';

class ShowDetailsProvider extends ChangeNotifier {
  bool _isLoading=true;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  late ShowDetails showDetails;
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
}
