import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/animation.dart';

class PostCreditsPage extends StatefulWidget {
  @override
  _PostCreditsPageState createState() => _PostCreditsPageState();
}

class _PostCreditsPageState extends State<PostCreditsPage> {
  double _opacityLevel = 0.0;

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
  }*/

  _showPoint(BuildContext context) async {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(
        builder: (context) => Positioned(
            bottom: 20.0,
            left: 350.0,
            child: Image.asset('assets/images/point.png')));

    overlayState.insert(overlayEntry);

    await Future.delayed(Duration(seconds: 2));

    overlayEntry.remove();
  }

  _showJaporOverlay(BuildContext context) {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(
        /*opaque: true,*/ builder: (context) {
      return Positioned(
          bottom: 20.0,
          left: 350.0,
          child: AnimatedOpacity(
              // If the widget is visible, animate to 0.0 (invisible).
              // If the widget is hidden, animate to 1.0 (fully visible).
              opacity: _opacityLevel,
              duration: Duration(seconds: 23),
              curve: Curves.easeInOutBack,
              // The green box must be a child of the AnimatedOpacity widget.
              child: Image.asset('assets/images/japor-snippet.png')));
    });

    overlayState.insert(overlayEntry);
  }

  _changeOpacity() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() => _opacityLevel = _opacityLevel == 0 ? 1.0 : 0.0);
    await Future.delayed(Duration(seconds: 4));
    setState(() => _opacityLevel = _opacityLevel == 0 ? 1.0 : 0.0);
  }

  @override
  void initState() {
    super.initState();
    //SystemChrome.setEnabledSystemUIOverlays([]);
    Future.delayed(Duration(seconds: 8), () {
      _showPoint(context);
    });
    Future.delayed(Duration(seconds: 9), () {
      //_changeOpacity();
      _showJaporOverlay(context);
      _changeOpacity();
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
        body: Center(
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
          )
        ])));
  }
}
