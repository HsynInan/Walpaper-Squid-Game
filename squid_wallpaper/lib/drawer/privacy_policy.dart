import 'package:flutter/material.dart';

class Privacy extends StatelessWidget {
  const Privacy({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        title: Text("Privacy Policy"),
      ),
      backgroundColor: Theme.of(context).accentColor,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "If you enable user authorization features within the application, the following additional information will be stored: \n- Storage,\n -Network access permission,\n We also collect the following (unknown) information to notify the application owner about usage. \n• The moment you open the application, \n• The screens you open in the application and the time you spend on these screens,\n• The moment you exit the application.\n Note: When user authorization features are enabled, we may associate anonymous information with your information when you log in.\nIf push notification ads are active in the application Information about BleshSDK users integrated with the application is given below.\n Thanks to BleshSDK, users' notification permission status, bluetooth status information, device information, advertising identifier (IDFA), location, operator, installed application list information can be accessed and necessary security measures are taken for conf. ID of this information.\nThe user's view of the campaign sent to him. If the User wants to save their name in the photo album, the User's photo album and camera are accessed and the screenshot is saved in the photo album. The information is shared with third parties only for the realization of these purposes and it is not allowed to publish and disclose information outside of this scope.",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
