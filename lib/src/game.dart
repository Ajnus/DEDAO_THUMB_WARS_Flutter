import 'dart:math';
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:counter/src/models/appstate.dart';
import 'package:counter/src/styles.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
//import 'package:flare_flutter/flare_actor.dart';
import 'ending.dart';

class GamePage extends StatefulWidget {
  //GamePage({Key key, this.title}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
  //_Animation createState() => _MyHomePageState();
}

/*class _Animation extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new FlareActor("assets/Meditating.flr",
        alignment: Alignment.center, fit: BoxFit.contain, animation: "idle");
  }
}*/

class _GamePageState extends State<GamePage> with TickerProviderStateMixin {
  int _counter = 0;
  static AudioCache player = new AudioCache();
  static AudioCache player2 = new AudioCache();

  AudioPlayer audioPlayer = AudioPlayer();

  // background music button
  static const audioPath3 =
      "John Williams - Battle of the Heroes (Official Audio).mp3";

  AnimationController _controller;
  AnimationController _controller2;
  Animation<Offset> _offsetAnimation;
  Animation<Offset> _offsetAnimation2;

  Color color = Colors.grey;
  double _opacityLevel = 1.0;

  void _incrementCounter() {
    setState(() {
      //player.play(audioPath2);
      int i;
      i = new Random().nextInt(11);
      player.play('$i.mp3');

      _counter++;
    });
  }

  void _hello() {
    setState(() async {
      audioPlayer = await player2.play(audioPath3);
      await Future.delayed(Duration(seconds: 80));
      audioPlayer.stop();
    });
  }

  void _decrementCounter() {
    setState(() {
      int i;
      i = new Random().nextInt(11);
      player.play('$i.mp3');

      _counter--;
    });
  }

  void _colorCheck() {
    if (_counter > 0)
      color = Colors.blueAccent;
    else if (_counter < 0)
      color = Colors.redAccent;
    else
      color = Colors.grey;
  }

  _changeOpacity() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() => _opacityLevel = _opacityLevel == 0 ? 1.0 : 0.0);
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _controller2 = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.0, -1.5),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    //
    _offsetAnimation2 = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.0, -1.5),
    ).animate(CurvedAnimation(parent: _controller2, curve: Curves.easeInOut));

    Future.delayed(Duration(milliseconds: 61950), () {
      showOverlay3A(context);
    });

    Future.delayed(Duration(milliseconds: 62950), () {
      showOverlay3(context);
      _changeOpacity();
      //Future.delayed(Duration(milliseconds: 47050), () { // ->
    });

    //});
    Future.delayed(Duration(seconds: 30), () {
      showOverlay(context);
    });
    Future.delayed(Duration(seconds: 40 + 5), () {
      showOverlay2(context);
    });

    Future.delayed(Duration(seconds: 70), () {
      showOverlay4(context);
      //_changeOpacity();
    });
    Future.delayed(
      const Duration(seconds: 80), // 40
      () {
        dispose();
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EndingPage()),
        );
      },
    );
  }

  showOverlay(BuildContext context) async {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(
        builder: (context) => Positioned(
            top: 170.0,
            right: MediaQuery.of(context).size.width / 2.0,
            child: Image.asset('assets/images/anavader.png')));

    overlayState.insert(overlayEntry);

    await Future.delayed(Duration(seconds: 2));

    overlayEntry.remove();
  }

  showOverlay2(BuildContext context) async {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(
        builder: (context) => Positioned(
            top: 170.0,
            left: MediaQuery.of(context).size.width / 2.0,
            child: Image.asset('assets/images/obi wan musta.png')));

    overlayState.insert(overlayEntry);

    await Future.delayed(Duration(seconds: 2));

    overlayEntry.remove();
  }

  showOverlay3(BuildContext context) {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(
        /*opaque: true,*/ builder: (context) {
      return Positioned(
          bottom: 148.0,
          right: 0.0,
          child: AnimatedOpacity(
              // If the widget is visible, animate to 0.0 (invisible).
              // If the widget is hidden, animate to 1.0 (fully visible).
              opacity: _opacityLevel,
              duration: Duration(seconds: 1),
              curve: Curves.easeInOutBack,
              // The green box must be a child of the AnimatedOpacity widget.
              child: Image.asset('assets/images/anachoke.png')));
    });

    overlayState.insert(overlayEntry);
    /*await Future.delayed(Duration(seconds: 1));
    await Future.delayed(Duration(seconds: 1));

    overlayEntry.remove();*/
  }

  showOverlay3A(BuildContext context) async {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(
        builder: (context) => Positioned(
            bottom: 110.0,
            right: 0.0,
            child: Image.asset('assets/images/point.png')));

    overlayState.insert(overlayEntry);

    await Future.delayed(Duration(seconds: 2));

    overlayEntry.remove();
  }

  showOverlay4(BuildContext context) async {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(
        /*opaque: true,*/ builder: (context) => Positioned(
            top: 90.0,
            right: 0.0,
            child: Opacity(
                opacity: 0.65,
                child: (Image.asset('assets/images/vadertable.png')))));

    for (int i = 0; i < 4; i++) {
      overlayState.insert(overlayEntry);
      await Future.delayed(Duration(milliseconds: 175));
      overlayEntry.remove();
      await Future.delayed(Duration(milliseconds: 175));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _colorCheck();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('DEDão WARS'),
        automaticallyImplyLeading: false,
        textTheme: TextTheme(
          title: TextStyle(
            fontFamily: 'StarJedi',
            color: Color(0xFFFFFF00),
            fontSize: 25.0,
          ),
        ),
      ),
      body: /*Container(
        child:*/
          Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /*Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset('assets/images/anavader.png'),
                Image.asset('assets/images/obiwan.png'),
              ],
              ),*/
            Image.asset('assets/vadervsobiwan.jpg'),
            if (_counter > 0)
              Text(
                'The Light Side the Force wins by:',
                style: TextStyle(
                  fontSize: 19,
                ),
              )
            else if (_counter < 0)
              Text(
                'The Dark Side the Force wins by:',
                style: TextStyle(
                  fontSize: 19,
                ),
              )
            else
              Text(
                'The Balance of the Force wins.',
                style: TextStyle(
                  fontSize: 19,
                ),
              ),
            Text(
              '$_counter',
              style: TextStyle(
                color: color,
                fontSize: 25,
              ),
            ),
            Image.asset('assets/flaws.jpg'),
          ],
        ),
      ),
      //),

      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(height: 50.0),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //crossAxisAlignment: CrossAxisAlignment.baseline,
              children: <Widget>[
            SlideTransition(
              position: _offsetAnimation2,
              child: FloatingActionButton(
                heroTag: "btn1",
                backgroundColor: Colors.red,
                onPressed: _decrementCounter,
                tooltip: 'Sith Rage',
                child: Icon(Icons.remove),
              ),
            ),
            FloatingActionButton(
              onPressed: _hello,
              backgroundColor: Colors.purple,
              tooltip: 'HELLO THERE!',
              child: Icon(Icons.music_note),
            ),
            SlideTransition(
              position: _offsetAnimation,
              child: FloatingActionButton(
                heroTag: "btn2",
                backgroundColor: Colors.blue,
                onPressed: _incrementCounter,
                tooltip: 'Jedi Balance',
                child: Icon(Icons.add),
              ),
            ),
          ]),
    );
  }
}
