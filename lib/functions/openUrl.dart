import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../constants/customColors.dart';
import '../constants/customTextStyle.dart';

class OpenWebView extends StatefulWidget {
  static const route = '/web_view';
  const OpenWebView({Key? key}) : super(key: key);

  @override
  State<OpenWebView> createState() => _OpenWebViewState();
}

class _OpenWebViewState extends State<OpenWebView> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    var routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    String url = routeArgs['Url'];
    print('----------------------------');
    print(url);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
            // backgroundColor: Colors.black,
            ),
      ),
      body: WillPopScope(
        onWillPop: _onWillPop,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: WebView(
            backgroundColor: black,
            allowsInlineMediaPlayback: true,
            zoomEnabled: true,
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: url,
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            elevation: 10,
            backgroundColor: black,
            title: Text(
              'Close?',
              style: TitleTS,
            ),
            content: Text(
              'Are you sure, you want to close this window?',
              style: defaultTS,
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(
                  'No',
                  style: defaultTS,
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text(
                  'Yes',
                  style: defaultTS,
                ),
              ),
            ],
          ),
        )) ??
        false;
  }
}
