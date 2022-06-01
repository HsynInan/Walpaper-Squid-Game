import 'package:flutter/material.dart';

class Hakkinda extends StatelessWidget {
  const Hakkinda({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        title: Text("About"),
      ),
      backgroundColor: Theme.of(context).accentColor,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
                "Squid Game (Korean: 오징어게임; RR: Ojing-eo Geim) is a South Korean survival drama television series written and directed by Hwang Dong-hyuk. Starring Lee Jung-jae, Park Hae-soo, and Wi Ha-joon, the nine-episode drama tells the story of a group of people who risk their lives in a mysterious survival game that has been awarded ₩45.6 billion (USD 38.7 million). . It was released worldwide by Netflix on September 17, 2021.\n\nThis is not an official 'SQUID GAME WALLPAPERS' app, not associated or affiliated with any of the developers or partners of any app. This app follows the 'fair use' guidelines under US law, if you feel there is a direct copyright or trademark violation that doesn't follow within the 'fair use' guidelines, please contact us directly at ajansmad@gmail.com.",
                style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
