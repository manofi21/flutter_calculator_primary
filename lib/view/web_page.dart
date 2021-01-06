import 'dart:io';

import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class WebViewProfile extends StatefulWidget {
  final String url, appBarTitle;

  const WebViewProfile({Key key, this.url, this.appBarTitle}) : super(key: key);
  @override
  _WebViewProfileState createState() => _WebViewProfileState();
}

class _WebViewProfileState extends State<WebViewProfile> {
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appBarTitle),
      ),
      body: WebView(
        initialUrl: widget.url,
      ),
    );
  }
}
