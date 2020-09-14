import 'dart:math';
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:counter/src/models/appstate.dart';
import 'package:counter/src/styles.dart';
import 'package:flame/sprite.dart';
import 'package:flame/spritesheet.dart';
import 'package:flame/widgets/animation_widget.dart';
import 'package:flame/widgets/sprite_widget.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
//import 'package:flare_flutter/flare_actor.dart';
import 'package:flame/animation.dart'
    as animation; // imports the Animation class under animation.Animation
import 'package:flame/flame.dart'; // imports the Flame helper class
import 'package:flame/position.dart'; // imports the Position class
//import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
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
  AnimationController _controllerH;
  //AnimationController _controllerH2;
  Animation<Offset> _offsetAnimation;

  Animation<double> positionAnimation;
  Animation<double> positionAnimation2;

  Curve _curve;
  Offset _offset;
  Color color = Colors.grey;
  double _opacityLevel = 1.0;

  //Sprite _sprite;
  //animation.Animation _animation;

  var WIDTH = 249.0;
  var HEIGHT = 83.0;
  static const AMOUNT = 5;

  //Sprite player = Sprite('player.png');

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

  //_aniLoad() async {}

  @override
  void initState() {
    super.initState();

    print('anaHeroOverlayIN');
    anaHeroOverlay(context);
    obiHeroOverlay(context);
    print('anaHeroOverlayOUT');

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _controllerH = AnimationController(
      duration: Duration(seconds: 10),
      vsync: this,
    )..forward();

    /*_controllerH2 = AnimationController(
      duration: Duration(seconds: 10),
      vsync: this,
    )..forward();*/

    _curve = Curves.easeInOut;
    _offset = const Offset(0.0, -1.5);

    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: _offset,
    ).animate(CurvedAnimation(parent: _controller, curve: _curve));

    final alignSec = TweenSequence<double>([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 412.0, end: 332.0), weight: 10.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 332.0, end: 332.0), weight: 88.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 332.0, end: 216.0), weight: 2.0)
    ]);

    final alignSec2 = TweenSequence<double>([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: -686.0, end: 0.0), weight: 70.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 0.0), weight: 28.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 98.0), weight: 2.0)
    ]);

    positionAnimation = alignSec
        .animate(CurvedAnimation(parent: _controllerH, curve: Curves.linear));
    positionAnimation2 = alignSec2
        .animate(CurvedAnimation(parent: _controllerH, curve: Curves.linear));

    Future.delayed(Duration(milliseconds: 9275), () {
      player2.play('speed.mp3');
    });

    Future.delayed(Duration(seconds: 10), () {
      setState(() {
        _offset = const Offset(0.0, -5.0);
      });
    });

    Future.delayed(Duration(seconds: 20), () {
      setState(() {
        _curve = Curves.easeOutQuart;
      });
    });

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
    /*Future.delayed(
      const Duration(seconds: 80), // 40
      () {
        dispose();
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EndingPage()),
        );
      },
    );*/
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
          bottom: 114.0,
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

  anaHeroOverlay(BuildContext context) async {
    OverlayState overlayState = Overlay.of(context);
    const sprite =
        'sprites/ana_standgreen-removebg-previe(4).png';
    const WIDTH = 86;
    const HEIGHT = 127;

    /*Sprite _sprite = await Sprite.loadSprite(sprite,
        width: 78.0, height: 115.0);*/

    await Flame.images.load(sprite);

    final _animationSpriteSheet = SpriteSheet(
      imageName: sprite,
      columns: 5,
      rows: 1,
      textureWidth: WIDTH,
      textureHeight: HEIGHT,
    );

    animation.Animation _animation = _animationSpriteSheet.createAnimation(
      0,
      stepTime: 0.2,
      to: 5,
    );

    // ignore: deprecated_member_use
    /*Flame.util.animationAsWidget(
        Position(WIDTH, HEIGHT),
        animation.Animation.sequenced('ana_stand2-removebg-preview(2).png', AMOUNT,
            textureWidth: 49.8));*/

    OverlayEntry overlayEntry = OverlayEntry(
        builder: (context) => Positioned(
            bottom: 360.0,
            left: 128.0,
            child: Container(
                width: WIDTH.toDouble(),
                height: HEIGHT.toDouble(),
                child: AnimationWidget(animation: _animation))));

    overlayState.insert(overlayEntry);

    //await Future.delayed(Duration(seconds: 2));

    //overlayEntry.remove();
  }

  obiHeroOverlay(BuildContext context) async {
    OverlayState overlayState = Overlay.of(context);
    const sprite = 'sprites/obi_stand_1_-removebg-preview-removebg-preview.png';
    const WIDTH = 123;
    const HEIGHT = 127;
    /*Sprite _sprite = await Sprite.loadSprite(sprite,
        width: 78.0, height: 115.0);*/

    await Flame.images.load(sprite);

    final _animationSpriteSheet = SpriteSheet(
      imageName: sprite,
      columns: 5,
      rows: 1,
      textureWidth: WIDTH,
      textureHeight: HEIGHT,
    );

    animation.Animation _animation = _animationSpriteSheet.createAnimation(
      0,
      stepTime: 0.2,
      to: 5,
    );

    // ignore: deprecated_member_use
    /*Flame.util.animationAsWidget(
        Position(WIDTH, HEIGHT),
        animation.Animation.sequenced('ana_stand2-removebg-preview(2).png', AMOUNT,
            textureWidth: 49.8));*/

    OverlayEntry overlayEntry = OverlayEntry(
        builder: (context) => Positioned(
            bottom: 360.0,
            right: 128.0,
            child: Container(
                width: WIDTH.toDouble(),
                height: HEIGHT.toDouble(),
                child: AnimationWidget(animation: _animation))));

    overlayState.insert(overlayEntry);

    //await Future.delayed(Duration(seconds: 2));

    //overlayEntry.remove();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controllerH.dispose();
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
      body: Stack(children: <Widget>[
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
              Container(height: 65.0),
              Image.asset('assets/flaws.jpg'),
            ],
          ),
        ),
        AnimatedBuilder(
            animation: _controllerH,
            builder: (BuildContext context, Widget child) {
              return Positioned(
                  left: positionAnimation.value,
                  top: 306.0,
                  child: Image.asset('assets/images/sprites/obi_base.png'));
            }),
        AnimatedBuilder(
            animation: _controllerH,
            builder: (BuildContext context, Widget child) {
              return Positioned(
                left: positionAnimation2.value,
                top: 347.0,
                child: Image.asset(
                    'assets/images/sprites/ana_base2-removebg-preview.png'),
              );
            })
      ]),
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
              position: _offsetAnimation,
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
