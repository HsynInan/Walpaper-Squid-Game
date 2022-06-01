/*import 'dart:math';

import 'package:flutter/material.dart';
import 'package:squid_wallpaper/service/ad_services.dart';
import 'package:squid_wallpaper/service/push_notification_service.dart';
import 'package:squid_wallpaper/tema.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_share/flutter_share.dart';

import 'appbar/player.dart';
import 'appbar/popular.dart';
import 'appbar/recent.dart';
import 'drawer/about.dart';
import 'drawer/other.dart';
import 'appbar/random.dart';
import 'drawer/privacy_policy.dart';
import 'locator.dart';

class HomeNavigator extends StatefulWidget {
  _HomeNavigatorState createState() => _HomeNavigatorState();
}

class _HomeNavigatorState extends State<HomeNavigator> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return DarkLightTheme(scaffoldKey: _scaffoldKey);
  }
}

class DarkLightTheme extends StatefulWidget {
  const DarkLightTheme({
    Key key,
    @required GlobalKey<ScaffoldState> scaffoldKey,
  })  : _scaffoldKey = scaffoldKey,
        super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  _DarkLightThemeState createState() => _DarkLightThemeState();
}

class _DarkLightThemeState extends State<DarkLightTheme> {
  void initState() {
    // locator<PushNotificationService>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        key: widget._scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).accentColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.asset(
                  'assets/logo3.png',
                  width: 160,
                ),
              ),
            ],
          ),
          leading: IconButton(
            onPressed: () {
              widget._scaffoldKey.currentState.openDrawer();
            },
            icon: Image.asset(
              "assets/triangle.png",
              color: Colors.white,
              width: 24,
              height: 24,
            ),
          ),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.crop_square,
                ),
                onPressed: () {
                  currentTheme.toggleTheme();
                })
          ],
          bottom: TabBar(
              indicatorColor: Color(0xfffcb1f54),
              labelColor: Color(0xfffce154f),
              unselectedLabelColor: Colors.grey,
              indicatorWeight: 2,
              tabs: [
                Tab(
                  text: "Recent",
                ),
                Tab(
                  text: "Players",
                ),
                Tab(
                  text: "Random",
                ),
                Tab(
                  text: "Popular",
                ),
              ]),
        ),
        drawer: Column(
          children: [
            Expanded(
              child: Drawer(
                child: Container(
                  color: Theme.of(context).accentColor,
                  child: Stack(
                    children: [
                      ListView(
                        children: [
                          DrawerHeader(
                            child: Image.asset(
                              'assets/logo3.png',
                            ),
                          ),
                          Divider(
                            color: Colors.white,
                          ),
                          ListTile(
                            title: Text(
                              "Home Page",
                              style: TextStyle(
                                fontFamily: "Raleway",
                                color: Colors.white,
                              ),
                            ),
                            leading:
                                Icon(Icons.home, color: Color(0xfffce154f)),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeNavigator()));
                            },
                          ),
                          Divider(
                            color: Colors.white,
                          ),
                          ListTile(
                              title: Text(
                                "Other Games",
                                style: TextStyle(
                                  fontFamily: "Raleway",
                                  color: Colors.white,
                                ),
                              ),
                              leading: Icon(Icons.devices_other,
                                  color: Color(0xfffce154f)),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DigerUygulamalar()));
                              }),
                          Divider(
                            color: Colors.white,
                          ),
                          ListTile(
                            title: Text(
                              "About",
                              style: TextStyle(
                                fontFamily: "Raleway",
                                color: Colors.white,
                              ),
                            ),
                            leading: Icon(Icons.wrap_text,
                                color: Color(0xfffce154f)),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Hakkinda()));
                            },
                          ),
                          Divider(
                            color: Colors.white,
                          ),
                          ListTile(
                            title: Text(
                              "Privacy Policy",
                              style: TextStyle(color: Colors.white),
                            ),
                            leading: Icon(Icons.privacy_tip,
                                color: Color(0xfffce154f)),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Privacy()));
                            },
                          ),
                          Divider(
                            color: Colors.white,
                          ),
                          ListTile(
                            title: Text(
                              "Rate it!",
                              style: TextStyle(
                                  fontFamily: "Raleway", color: Colors.white),
                            ),
                            leading:
                                Icon(Icons.thumb_up, color: Color(0xfffce154f)),
                            onTap: () {
                              _urlAc('https://play.google.com/store');
                            },
                          ),
                          Divider(
                            color: Colors.white,
                          ),
                          ListTile(
                            title: Text(
                              "Recommend to a Friend!",
                              style: TextStyle(
                                fontFamily: "Raleway",
                                color: Colors.white,
                              ),
                            ),
                            leading:
                                Icon(Icons.share, color: Color(0xfffce154f)),
                            onTap: () {
                              paylas();
                            },
                          ),
                          Divider(
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Theme.of(context).accentColor,

        body: TabBarView(
          children: [
            Recent(),
            Player(),
            Random(),
            Popular(),
          ],
        ),
        //bottomNavigationBar: Container(child: BannerReklam()),
      ),
    );
  }

  Future<void> paylas() async {
    await FlutterShare.share(
        title: "Share",
        text: "Download our app from this link.",
        linkUrl: "https://play.google.com/store",
        chooserTitle: "Share the app");
  }

  Future _urlAc(String link) async {
    if (await canLaunch(link)) {
      await launch(link);
    } else {
      debugPrint('gönderdiğin linki açamıyorum');
    }
  }
}*/
