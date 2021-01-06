import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:working_test/view/biodata_page.dart';
import 'package:working_test/view/calculator_page/calculator_page.dart';
import 'package:working_test/view/history_page.dart';
import 'package:working_test/view_model/notivier_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // home: BiodataPage(),
        home: ChangeNotifierProvider<ChangePrimaryNotivier>(
          create: (_) => ChangePrimaryNotivier(),
          child: MyHomePage(),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final providerRead = context.watch<ChangePrimaryNotivier>();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Primes Check \nCalculator",
            style: TextStyle(fontSize: 17),
          ),
          actions: [
            FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HistoryList(
                              primeList: providerRead.primeList,
                            )),
                  );
                },
                child: Text("History"))
          ],
        ),
        body: CalculatorPages(
          providerRead: providerRead,
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              drawerHeader,
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).push(PageRouteBuilder(
                        pageBuilder: (context, animation, anotherAnimation) {
                          return BiodataPage();
                        },
                        transitionDuration: Duration(seconds: 1),
                        transitionsBuilder:
                            (context, animation, anotherAnimation, child) {
                          animation = CurvedAnimation(
                              curve: Curves.ease, parent: animation);
                          return Align(
                            child: FadeTransition(
                              opacity: animation,
                              child: child,
                            ),
                          );
                        }));
                  },
                  child: Text("See the Biodata"))
            ],
          ),
        ));
  }
}

final drawerHeader = UserAccountsDrawerHeader(
  accountName: Text('Jeremia Manogi Mario'),
  accountEmail: GestureDetector(
      onTap: () {
        launch(
            "mailto:jeremia.manogi.mario@gmail.com?subject=Asking A Question&body=I want to asking some Question");
      },
      child: Text('jeremia.manogi.mario@email.com')),
  currentAccountPicture: Hero(
    tag: "photo-profile",
    child: CircleAvatar(
      backgroundImage: AssetImage("assets/profile.jpg"),
      backgroundColor: Colors.white,
      // child: Image.asset("assets/profile.jpg"),
    ),
  ),
);
