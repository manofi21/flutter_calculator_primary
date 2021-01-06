import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:working_test/view/web_page.dart';

class BiodataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Biodata Information")),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
            Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.transparent.withOpacity(0.2),
                        blurRadius: 2.0,
                        spreadRadius: 3.0,
                        offset: Offset(
                          6.0,
                          5.0,
                        ))
                  ],
                  color: Colors.lime,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 7, color: Colors.white60)),
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: 16, left: 10, right: 10, top: 6),
                child: Text("Jeremia Manogi Mario",
                    style:
                        TextStyle(fontFamily: "PoppinsRegular", fontSize: 15)),
              ),
            ),
            GestureDetector(
              onTap: () {
                // ! error one
                // final Uri _emailLaunchUri = Uri(
                //     scheme: 'jeremia',
                //     path: 'jeremia.manogi.mario@gmail.com',
                //     queryParameters: {'subject': 'Asking A Question'});

                launch(
                    "mailto:jeremia.manogi.mario@gmail.com?subject=Asking A Question&body=I want to asking some Question");
              },
              child: Container(
                margin: EdgeInsets.only(top: 16),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.transparent.withOpacity(0.2),
                          blurRadius: 2.0,
                          spreadRadius: 3.0,
                          offset: Offset(
                            6.0,
                            5.0,
                          ))
                    ],
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 7, color: Colors.white60)),
                child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 16, left: 10, right: 10, top: 6),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: SizedBox(
                              height: 35,
                              child: Image.asset("assets/gmail.png", scale: 3)),
                        ),
                        Text("jeremia.manogi.mario@gmail.com",
                            style: TextStyle(
                                fontFamily: "PoppinsRegular", fontSize: 12)),
                      ],
                    )),
              ),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WebViewProfile(
                              appBarTitle: "Github Profile",
                              url: "https://github.com/manofi21",
                            )),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 16),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.transparent.withOpacity(0.2),
                            blurRadius: 2.0,
                            spreadRadius: 3.0,
                            offset: Offset(
                              6.0,
                              5.0,
                            ))
                      ],
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 7, color: Colors.white60)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 16, left: 10, right: 10, top: 6),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: SizedBox(
                              height: 35,
                              child:
                                  Image.asset("assets/github.png", scale: 3)),
                        ),
                        Text("https://github.com/manofi21",
                            style: TextStyle(
                                fontFamily: "PoppinsRegular",
                                fontSize: 12,
                                color: Colors.white)),
                      ],
                    ),
                  ),
                )),
            GestureDetector(
                onTap: () {
                  // ? doesn't show website
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => WebViewProfile(
                  //             appBarTitle: "Linkedin Profile",
                  //             url: "https://www.linkedin.com/in/jeremiamanogi",
                  //           )),
                  // );
                  launch("https://www.linkedin.com/in/jeremiamanogi");
                },
                child: Container(
                  margin: EdgeInsets.only(top: 16),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.transparent.withOpacity(0.2),
                            blurRadius: 2.0,
                            spreadRadius: 3.0,
                            offset: Offset(
                              6.0,
                              5.0,
                            ))
                      ],
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 7, color: Colors.white60)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 16, left: 10, right: 10, top: 6),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: SizedBox(
                              height: 35,
                              child:
                                  Image.asset("assets/linkedin.png", scale: 3)),
                        ),
                        Text("https://www.linkedin.com/in/jeremiamanogi",
                            style: TextStyle(
                                fontFamily: "PoppinsRegular",
                                fontSize: 12,
                                color: Colors.black)),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
