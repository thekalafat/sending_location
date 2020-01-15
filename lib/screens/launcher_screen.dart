import 'package:flutter/material.dart';
import 'package:sending_location/screens/contacts_screen.dart';
import 'package:splashscreen/splashscreen.dart';

class LauncherScreen extends StatefulWidget {
  @override
  _LauncherScreenState createState() => new _LauncherScreenState();
}

class _LauncherScreenState extends State<LauncherScreen> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 3,
        navigateAfterSeconds: new contacts_screen(),
        title: new Text('Welcome to Share Location',
          style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0
          ),),
        image: new Image.asset('images/location.png'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 80.0,
        loaderColor: Colors.red
    );
  }
}