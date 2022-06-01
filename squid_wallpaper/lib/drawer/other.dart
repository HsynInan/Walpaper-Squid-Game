import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DigerUygulamalar extends StatelessWidget {
  const DigerUygulamalar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        title: Text(
          "Other Games",
          style: TextStyle(fontFamily: "Raleway"),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          children: <Widget>[
            Material(
              elevation: 5,
              shadowColor: Theme.of(context).accentColor,
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(12),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  _urlAc('https://play.google.com/store/');
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 12, right: 12, bottom: 12, top: 12),
                  child: Row(
                    children: <Widget>[
                      FlutterLogo(),
                      /*ClipRRect(
                        child: Image.asset(
                          'assets/game.png',
                          width: 48,
                          height: 48,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),*/
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Flutter App',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: "Raleway",
                                color: Theme.of(context).buttonColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Tap to go to app',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: 'Lato',
                                color: Theme.of(context).buttonColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Theme.of(context).buttonColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            /*Material(
              elevation: 5,
              shadowColor: Theme.of(context).accentColor,
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(12),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  _urlAc(
                      'https://play.google.com/store/apps/details?id=com.HVNGames.DangerousRoad');
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 12, right: 12, bottom: 12, top: 12),
                  child: Row(
                    children: <Widget>[
                      ClipRRect(
                        child: Image.asset(
                          'assets/world.png',
                          width: 48,
                          height: 48,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'World Truck Simulator : Dangerous Road',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: "Raleway",
                                color: Theme.of(context).buttonColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Uygulamaya gitmek için dokunun',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: 'Lato',
                                color: Theme.of(context).buttonColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Theme.of(context).buttonColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Material(
              elevation: 5,
              shadowColor: Theme.of(context).accentColor,
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(12),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  _urlAc(
                      'https://play.google.com/store/apps/details?id=com.HVNGames.BusSimulatorDeathRoads');
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 12, right: 12, bottom: 12, top: 12),
                  child: Row(
                    children: <Widget>[
                      ClipRRect(
                        child: Image.asset(
                          'assets/bus.png',
                          width: 48,
                          height: 48,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Bus Simulator : Death Roads',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: "Raleway",
                                color: Theme.of(context).buttonColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Uygulamaya gitmek için dokunun',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: 'Lato',
                                color: Theme.of(context).buttonColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Theme.of(context).buttonColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Material(
              elevation: 5,
              shadowColor: Theme.of(context).accentColor,
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(12),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  _urlAc(
                      'https://play.google.com/store/apps/details?id=com.H.V.N.Games.SpeedShape');
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 12, right: 12, bottom: 12, top: 12),
                  child: Row(
                    children: <Widget>[
                      ClipRRect(
                        child: Image.asset(
                          'assets/speed.png',
                          width: 48,
                          height: 48,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Speed Shape - Match The Shapes Right!',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: "Raleway",
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).buttonColor,
                              ),
                            ),
                            Text(
                              'Uygulamaya gitmek için dokunun',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: 'Lato',
                                color: Theme.of(context).buttonColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Theme.of(context).buttonColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Material(
              elevation: 5,
              shadowColor: Theme.of(context).accentColor,
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(12),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  _urlAc(
                      'https://play.google.com/store/apps/details?id=com.HVNGames.TruckGameTransportWood');
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 12, right: 12, bottom: 12, top: 12),
                  child: Row(
                    children: <Widget>[
                      ClipRRect(
                        child: Image.asset(
                          'assets/wood.png',
                          width: 48,
                          height: 48,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Truck Simulator: Wood Transport',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: "Raleway",
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).buttonColor,
                              ),
                            ),
                            Text(
                              'Uygulamaya gitmek için dokunun',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: 'Lato',
                                color: Theme.of(context).buttonColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Theme.of(context).buttonColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Material(
              elevation: 5,
              shadowColor: Theme.of(context).accentColor,
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(12),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  _urlAc(
                      'https://play.google.com/store/apps/details?id=com.H.V.N.Games.OffroadTruckDriver3D');
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 12, right: 12, bottom: 12, top: 12),
                  child: Row(
                    children: <Widget>[
                      ClipRRect(
                        child: Image.asset(
                          'assets/truck.png',
                          width: 48,
                          height: 48,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Offroad Simulator : Extreme',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "Raleway",
                                color: Theme.of(context).buttonColor,
                              ),
                            ),
                            Text(
                              'Uygulamaya gitmek için dokunun',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: 'Lato',
                                color: Theme.of(context).buttonColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Theme.of(context).buttonColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),*/
            SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}

Future _urlAc(String link) async {
  if (await canLaunch(link)) {
    await launch(link);
  } else {
    debugPrint('gönderdiğin linki açamıyorum');
  }
}
