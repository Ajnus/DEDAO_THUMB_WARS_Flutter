import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/animation.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:video_player/video_player.dart';

class PostCreditsPage extends StatefulWidget {
  @override
  _PostCreditsPageState createState() => _PostCreditsPageState();
}

class _PostCreditsPageState extends State<PostCreditsPage>
    with TickerProviderStateMixin {
  AnimationController _controller;
  AnimationController _controller2;
  VideoPlayerController _vcontroller;
  static AudioCache player = new AudioCache();
  static AudioCache player2 = new AudioCache();
  double _opacityLevel = 0.0;

  static const master = 'Master Skywalker, there are too many of them.mp3';
  static const rey = 'Rey.mp3';
  static const balance = 'flutter_assets/Balance_to_The_Force.mp4';
  static const aubalance = 'Balance_to_The_Force.mp3';
  static const door = 'door2.mp3';
  static const vadersaber = 'vadersaber5.mp3';

  _prophecy(BuildContext context) {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(
        builder: (context) => Scaffold(
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
                ]))));

    overlayState.insert(overlayEntry);
  }

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
              duration: Duration(seconds: 12),
              curve: Curves.easeInOutBack,
              // The green box must be a child of the AnimatedOpacity widget.
              child: Image.asset('assets/images/japor-snippet.png')));
    });

    overlayState.insert(overlayEntry);
  }

  _changeOpacity() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() => _opacityLevel = _opacityLevel == 0 ? 1.0 : 0.0);
    /*await Future.delayed(Duration(seconds: 4));
    setState(() => _opacityLevel = _opacityLevel == 0 ? 1.0 : 0.0);*/
  }

  _wallOverlay(BuildContext context) {
    //_controller.dispose();
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(
        /*opaque: true,*/ builder: (context) {
      return LayoutBuilder(
        builder: (context, constraints) {
          final Size biggest = constraints.biggest;

          return Stack(children: [
            PositionedTransition(
              rect: RelativeRectTween(
                begin: RelativeRect.fromSize(
                    Rect.fromLTWH(-5947.0, 168.0, 1107.0, 83.0), biggest),
                end: RelativeRect.fromSize(
                    Rect.fromLTWH(-500.0, 168.0, 1107.0, 83.0), biggest),
              ).animate(
                  CurvedAnimation(parent: _controller, curve: Curves.linear)),
              child:
                  /*Padding(
                    padding: const EdgeInsets.all(8),
                    child:*/
                  Image.asset('assets/images/black tie.png'),
            ),
            PositionedTransition(
              rect: RelativeRectTween(
                begin: RelativeRect.fromSize(
                    Rect.fromLTWH(5931.090, 168.0, 1107.0, 83.0), biggest),
                end: RelativeRect.fromSize(
                    Rect.fromLTWH(786.0, 168.0, 1107.0, 83.0), biggest),
              ).animate(
                  CurvedAnimation(parent: _controller, curve: Curves.linear)),
              child:
                  /*Padding(
                    padding: const EdgeInsets.all(8),
                    child:*/
                  Image.asset('assets/images/black tie.png'),
            )
          ]);
        },
      );
    });

    //await Future.delayed(Duration(seconds: 71));
    overlayState.insert(overlayEntry);
    //overlayState.build(overlayEntry);
    /*await Future.delayed(Duration(seconds: 1));
      await Future.delayed(Duration(seconds: 1));

      overlayEntry.remove();*/ // { ( { ( { (
  }

  _wallOverlay2(BuildContext context) {
    //_controller.dispose();
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(
        /*opaque: true,*/ builder: (context) {
      return LayoutBuilder(
        builder: (context, constraints) {
          final Size biggest = constraints.biggest;

          return Stack(children: [
            PositionedTransition(
              rect: RelativeRectTween(
                begin: RelativeRect.fromSize(
                    Rect.fromLTWH(600.0, 550.250, 1107.0, 83.0), biggest),
                end: RelativeRect.fromSize(
                    Rect.fromLTWH(600.0, 218.0, 1107.0, 83.0), biggest),
              ).animate(
                  CurvedAnimation(parent: _controller2, curve: Curves.linear)),
              child:
                  /*Padding(
                    padding: const EdgeInsets.all(8),
                    child:*/
                  Image.asset('assets/images/black tie.png'),
            )
          ]);
        },
      );
    });

    //await Future.delayed(Duration(seconds: 71));
    overlayState.insert(overlayEntry);
    //overlayState.build(overlayEntry);
    /*await Future.delayed(Duration(seconds: 1));
      await Future.delayed(Duration(seconds: 1));

      overlayEntry.remove();*/ // { ( { ( { (
  }

  _showVideoOverlay(BuildContext context) async {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry =
        OverlayEntry(builder: (context) => VideoPlayer(_vcontroller));

    overlayState.insert(overlayEntry);

    await Future.delayed(Duration(seconds: 5));

    overlayEntry.remove();
  }

  @override
  void initState() {
    super.initState();
    //SystemChrome.setEnabledSystemUIOverlays([]);

    _controller = AnimationController(
      duration: Duration(seconds: 35),
      vsync: this,
    )..forward();

    _controller2 = AnimationController(
      duration: Duration(seconds: 42),
      vsync: this,
    )..forward();

    _vcontroller = VideoPlayerController.asset(balance);

    _vcontroller.addListener(() {
      setState(() {});
    });

    Future.delayed(Duration(seconds: 4), () {
      _prophecy(context);
    });

    Future.delayed(Duration(seconds: 4 + 11), () {
      //_showPoint(context);
      _showPoint(context);
      _showJaporOverlay(context);
      _changeOpacity();
    });

    Future.delayed(Duration(seconds: 4 + 10 + 9), () {
      _showPoint(context);
      _changeOpacity();
      //Future.delayed(Duration(milliseconds: 100), () {
      _wallOverlay(context);
      _wallOverlay2(context);
      //});
      //_showPoint(context);
    });

    Future.delayed(Duration(seconds: 4 + 10 + 9 + 25), () {
      player.play(master);
    });

    Future.delayed(Duration(seconds: 4 + 10 + 9 + 25 + 4), () {
      player2.play(rey);
    });

    Future.delayed(Duration(seconds: 4 + 10 + 9 + 25 + 4 + 1), () {
      player.play(door);
      Future.delayed(Duration(milliseconds: 600), () {
        player2.play(aubalance);
      });
      _showVideoOverlay(context);
      _vcontroller.initialize().then((_) => setState(() {}));
      _vcontroller.setVolume(0.0);
      _vcontroller.play();
      print('playing');
    });

    Future.delayed(Duration(milliseconds: 4000 + 10000 + 9000 + 25000 + 4000 + 5400), () {
      player.play(vadersaber);
    });

    Future.delayed(Duration(seconds: 4 + 10 + 9 + 25 + 4 + 11), () {
      SystemNavigator.pop();
      //exit();
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold();
  }
}
