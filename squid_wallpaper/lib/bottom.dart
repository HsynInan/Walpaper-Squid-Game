import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:squid_wallpaper/appbar/player.dart';
import 'package:squid_wallpaper/appbar/popular.dart';
import 'package:squid_wallpaper/appbar/random.dart';
import 'package:squid_wallpaper/appbar/recent.dart';
import 'package:squid_wallpaper/drawer/about.dart';
import 'package:squid_wallpaper/drawer/other.dart';
import 'package:squid_wallpaper/drawer/privacy_policy.dart';
import 'package:squid_wallpaper/navigator.dart';
import 'package:squid_wallpaper/service/ad_services.dart';
import 'package:squid_wallpaper/service/push_notification_service.dart';
import 'package:squid_wallpaper/tema.dart';
import 'package:url_launcher/url_launcher.dart';

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

class _DarkLightThemeState extends State<DarkLightTheme>
    with SingleTickerProviderStateMixin {
  final autoSizeGroup = AutoSizeGroup();
  var _bottomNavIndex = 0; //default index of a first screen

  AnimationController _animationController;
  Animation<double> animation;
  CurvedAnimation curve;

  final textlist = <Text>[
    Text("Recent"),
    Text("Player"),
    Text("Random"),
    Text("Popular"),
  ];
  final tabs = [
    Center(child: Recent()),
    Center(child: Player()),
    Center(child: Random()),
    Center(child: Popular()),
  ];

//currentTheme.toggleTheme();
  @override
  void initState() {
    super.initState();
    locator<PushNotificationService>().init();

    final systemTheme = SystemUiOverlayStyle.light.copyWith(
      systemNavigationBarColor: HexColor('#373A36'),
      systemNavigationBarIconBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(systemTheme);

    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    curve = CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curve);

    Future.delayed(
      Duration(seconds: 1),
      () => _animationController.forward(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
      ),

      //
      key: widget._scaffoldKey,
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
                          leading: Icon(Icons.home, color: Color(0xfffce154f)),
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
                            "Other Apps",
                            style: TextStyle(
                              fontFamily: "Raleway",
                              color: Colors.white,
                            ),
                          ),
                          leading: Icon(Icons.devices_other,
                              color: Color(0xfffce154f)),
                          onTap: () {
                            _urlAc(
                                'https://play.google.com/store/apps/developer?id=Mad+Ajans');
                          },
                        ),
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
                          leading:
                              Icon(Icons.wrap_text, color: Color(0xfffce154f)),
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
                            _urlAc(
                                'https://play.google.com/store/apps/details?id=com.madajans.squidgamewallpaper');
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
                          leading: Icon(Icons.share, color: Color(0xfffce154f)),
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
      backgroundColor: Colors.white,
      extendBody: true,
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Theme.of(context).accentColor,
              width: double.infinity,
              height: 40,
              child: BannerReklam(),
            ),
          ),
          Expanded(flex: 13, child: tabs[_bottomNavIndex]),
        ],
      ),
      floatingActionButton: ScaleTransition(
        scale: animation,
        child: FloatingActionButton(
          elevation: 8,
          backgroundColor: Color(0xfffce154f),
          child: Image.asset(
            "assets/rec.png",
            width: 24,
            height: 24,
            color: Theme.of(context).accentColor,
          ),
          onPressed: () {
            _animationController.reset();
            _animationController.forward();
            currentTheme.toggleTheme();
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: textlist.length,
        tabBuilder: (int index, bool isActive) {
          final color = isActive ? HexColor('#FFA400') : Colors.white;
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textlist[index].data,
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: Color(0xfffce154f)),
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: AutoSizeText(
                  "brightness $index",
                  maxLines: 1,
                  style: TextStyle(color: color),
                  group: autoSizeGroup,
                ),
              )
            ],
          );
        },
        backgroundColor: Theme.of(context).accentColor,
        activeIndex: _bottomNavIndex,
        splashColor: Color(0xfff075447),
        notchAndCornersAnimation: animation,
        splashSpeedInMilliseconds: 300,
        notchSmoothness: NotchSmoothness.defaultEdge,
        gapLocation: GapLocation.center,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) => setState(() => _bottomNavIndex = index),
      ),
    );
  }

  Future<void> paylas() async {
    await FlutterShare.share(
        title: "Share",
        text: "Download our app from this link.",
        linkUrl:
            "https://play.google.com/store/apps/details?id=com.madajans.squidgamewallpaper",
        chooserTitle: "Share the app");
  }

  Future _urlAc(String link) async {
    if (await canLaunch(link)) {
      await launch(link);
    } else {
      debugPrint('gönderdiğin linki açamıyorum');
    }
  }

  AutoSizeText(String, {int maxLines, TextStyle style, AutoSizeGroup group}) {}
}

class AutoSizeGroup {}

class NavigationScreen extends StatefulWidget {
  final IconData iconData;

  NavigationScreen(this.iconData) : super();

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> animation;

  @override
  void didUpdateWidget(NavigationScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.iconData != widget.iconData) {
      _startAnimation();
    }
  }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.forward();
    super.initState();
  }

  _startAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Center(
        child: CircularRevealAnimation(
          animation: animation,
          centerOffset: Offset(80, 80),
          maxRadius: MediaQuery.of(context).size.longestSide * 1.1,
          child: Icon(
            widget.iconData,
            color: HexColor('#FFA400'),
            size: 160,
          ),
        ),
      ),
    );
  }

  CircularRevealAnimation(
      {Animation<double> animation,
      Offset centerOffset,
      double maxRadius,
      Icon child}) {}
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
