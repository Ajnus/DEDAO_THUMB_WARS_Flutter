import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class PostCreditsPage extends StatefulWidget {
  @override
  _PostCreditsPageState createState() => _PostCreditsPageState();
}

class _PostCreditsPageState extends State<PostCreditsPage> {
  Center _prophecy() {
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
          TyperAnimatedTextKit(
            text: [
              '          \"(...) in a time of great dispair, a child shall be born.\n\n',
            ],
            textStyle: TextStyle(
                fontSize: 15.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Colors.white),
            textAlign: TextAlign.justify,
            speed: Duration(milliseconds: 90),
            isRepeatingAnimation: false,
            //pause: Duration(seconds: 5),
          ),
          //await Future.delayed(Duration(seconds: 5)),
          TyperAnimatedTextKit(
            text: [
              '                                                                                         He will destroy the Sith, and bring BALANCE to THE FORCE.\"',
            ],
            textStyle: TextStyle(
                fontSize: 15.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Colors.white),
            textAlign: TextAlign.justify,
            speed: Duration(milliseconds: 90),
            isRepeatingAnimation: false,
          ),
        ]));
  }

  /*_prophecy2(BuildContext context) {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(builder: (context) {
      return Scaffold(
          body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
            
          ])));
    });

    overlayState.insert(overlayEntry);
  }

  @override
  void initState() {
    super.initState();
   //SystemChrome.setEnabledSystemUIOverlays([]);
  }*/

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(body: _prophecy(), );
  }
}