import 'dart:convert';

//import 'package:firebase_admob/firebase_admob.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:squid_wallpaper/service/Count.dart';
import 'package:squid_wallpaper/service/firebaseadmob.dart';

import '../download.dart';

class Popular extends StatefulWidget {
  const Popular({Key key}) : super(key: key);

  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  List konu;
  final ams = AdMobService();

  @override
  Widget build(BuildContext context) {
    InterstitialAd newAdd = ams.getNewTripInterstitial();
    newAdd.load();
    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.asset(
                'assets/logo2.png',
                width: 160,
              ),
            ),
          ],
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
      ),*/
      backgroundColor: Theme.of(context).accentColor,
      body: Center(
        child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString("assets/popular.json"),
            builder: (context, cevap) {
              konu = jsonDecode(cevap.data.toString());
              return GridView.builder(
                itemCount: konu == null ? 0 : konu.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    child: Image.network(
                      konu[index]["resim"],
                      width: 500,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                    onTap: () {
                      if (ReklamMiktari.ReklamSayisi % 101 == 0) {
                        ReklamMiktari.ReklamSayisi =
                            ReklamMiktari.ReklamSayisi + 1;
                      } else {
                        newAdd.show(
                            anchorType: AnchorType.bottom,
                            anchorOffset: 0.0,
                            horizontalCenterOffset: 0.0);
                      }
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (contex) => MyHomePage(
                                    fileName2: konu[index]["isim"],
                                    url2: konu[index]["resim"],
                                  )));
                    },
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
                    mainAxisExtent: 350,
                    crossAxisCount: 2),
              );
            }),
      ),
    );
  }
}
