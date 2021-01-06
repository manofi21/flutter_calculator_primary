import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:working_test/model/biodata_class.dart';
import 'package:working_test/view/biodata_page/widget/button.dart';
import 'package:working_test/view/web_page.dart';

class BiodataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final listBiodata = [
      Biodata(null, Colors.lime, "Jeremia Manogi Mario"),
      Biodata(() {
        launch(
            "mailto:jeremia.manogi.mario@gmail.com?subject=Asking A Question&body=I want to asking some Question");
      }, Colors.red, "jeremia.manogi.mario@gmail.com", "assets/gmail.png"),
      Biodata(() {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WebViewProfile(
                    appBarTitle: "Github Profile",
                    url: "https://github.com/manofi21",
                  )),
        );
      }, Colors.black.withOpacity(0.7), "https://github.com/manofi21",
          "assets/github.png"),
      Biodata(() {
        launch("https://www.linkedin.com/in/jeremiamanogi");
      }, Colors.blueAccent, "https://www.linkedin.com/in/jeremiamanogi",
          "assets/linkedin.png")
    ];

    return Scaffold(
      appBar: AppBar(title: Text("Biodata Information")),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Photo Profile
            Hero(
              tag: "photo-profile",
              child: Container(
                width: 100,
                height: 150,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("assets/profile.jpg"))),
              ),
            ),
            Column(
              children: listBiodata.map((e) => ContainerDecoration(e)).toList(),
            )
          ],
        ),
      ),
    );
  }
}
