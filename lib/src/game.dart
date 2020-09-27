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
/*import 'package:spritewidget/spritewidget.dart';
import 'dart:ui' as ui show Image;*/

class GamePage extends StatefulWidget {
  //GamePage({Key key, this.title}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
  //_Animation createState() => _MyHomePageState();
}

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
  AnimationController _controller3;
  AnimationController _controllerH;

  Animation<Offset> _offsetAnimation;
  Animation<Offset> _offsetAnimation2;
  Animation<Offset> postionGuitarAnimation;
  Animation<Offset> postionGuitarAnimation2;

  Animation<double> positionAnimation;
  Animation<double> positionAnimation2;

  Color color = Colors.grey;
  double _opacityLevel = 1.0;
  double _heroOpacityLevel = 1.0;
  int animationID = 0;
  int animation2ID = 0;
  int powerAnimationID = 0;
  double _position = 0.0;
  double powerPos = 0.0;

  OverlayState overlayState;
  OverlayEntry overlayEntry;
  OverlayState overlayState2;
  OverlayEntry overlayEntry2;

  String sprite0;
  String sprite1;
  String sprite2;
  String sprite3;
  // improviso
  String sprite4A;
  String sprite4B;
  String sprite4C;
  String sprite4D;
  String sprite4E;
  String sprite4F;
  String sprite4G;
  String sprite4H;
  String sprite4I;
  String sprite4J;

  String sprite5;
  String sprite50;
  String sprite8;
  String sprite9;

  String sprite0b;
  String sprite1b;
  String sprite2b;
  String sprite3b;

  String sprite7bA;
  String sprite7bB;
  String sprite7bC;
  String sprite7bD;
  String sprite7bE;
  String sprite7bF;
  String sprite7bG;
  String sprite7bH;
  String sprite7bI;
  String sprite7bJ;
  String sprite7bK;
  String sprite7bL;
  String sprite7bM;
  String sprite7bN;

  String sprite8b;
  String sprite9b;

  double attackTime;

  void _incrementCounter() async {
    setState(() {
      //player.play(audioPath2);

      int i, j;

      j = new Random().nextInt(3);
      animation2ID = j + 1;
      if (animation2ID == 2) {
        animationID = 9;
      } else
        animationID = 8;

      if (_position > -135.0) _position = _position - 15.0;

      overlayEntry2.remove();
      obiHeroOverlay(context, animation2ID);
      overlayEntry.remove();
      anaHeroOverlay(context, animationID);

      i = new Random().nextInt(11);
      player.play('$i.mp3');

      _counter++;
    });

    await Future.delayed(Duration(milliseconds: (attackTime * 1000).toInt()));

    setState(() {
      animation2ID = 0;
      animationID = 0;

      overlayEntry2.remove();
      obiHeroOverlay(context, animation2ID);
      overlayEntry.remove();
      anaHeroOverlay(context, animationID);
    });
  }

  void _hello() {
    setState(() async {
      audioPlayer = await player2.play(audioPath3);
      await Future.delayed(Duration(seconds: 80));
      audioPlayer.stop();
    });
  }

  void _decrementCounter() async {
    int i, j;

    j = new Random().nextInt(3);
    i = new Random().nextInt(11);
    animationID = j + 1;

    if (animationID == 2) {
      animation2ID = 9;
    } else
      animation2ID = 8;

    setState(() {
      if (_position < 135.0) {
        _position += 15;
      }

      overlayEntry.remove();
      anaHeroOverlay(context, animationID);
      overlayEntry2.remove();
      obiHeroOverlay(context, animation2ID);

      _counter--;
    });

    player.play('$i.mp3');

    await Future.delayed(Duration(milliseconds: (attackTime * 1000).toInt()));

    animationID = 0;
    animation2ID = 0;

    setState(() {
      //pulou = false;
      /*_jumpAnimation = Tween<Offset>(begin: Offset.zero, end: Offset(0.0, 0.0))
        .animate(CurvedAnimation(parent: _controllerJ, curve: Curves.linear));*/
      overlayEntry.remove();
      anaHeroOverlay(context, animationID);
      overlayEntry2.remove();
      obiHeroOverlay(context, animation2ID);
    });
  }

  void _decrementCounterS() async {
    int i = new Random().nextInt(2);
    animationID = i + 4;

    animation2ID = 8;
    overlayEntry2.remove();
    obiHeroOverlay(context, animation2ID);

    if (animationID == 4) {
      // jump
      for (animationID = 40; animationID < 49; animationID++) {
        setState(() {
          overlayEntry.remove();
          anaHeroOverlay(context, animationID);

          _position = _position - 35.0;
          if (_position < -128.0) {
            _position = -128.0;
          }
        });

        await Future.delayed(Duration(milliseconds: 75));
      }

      // throw
      animationID = 4;
      setState(() {
        if (overlayEntry != null) {
          overlayEntry.remove();
          overlayEntry = null;
        }

        anaHeroOverlay(context, animationID);
        player.play('7.mp3');
      });

      await Future.delayed(Duration(milliseconds: 275));
      player.play('5.mp3');

      await Future.delayed(Duration(milliseconds: 825));
    } else if (animationID == 5) {
      setState(() {
        if (overlayEntry != null) {
          overlayEntry.remove();
          overlayEntry = null;
        }

        anaHeroOverlay(context, animationID);
      });
      await Future.delayed(Duration(milliseconds: 1300));
      player.play('ana_Special.mp3');

      animationID = 50;
      overlayEntry.remove();
      anaHeroOverlay(context, animationID);

      // obi_Fly
      for (animation2ID = 70; animation2ID < 84; animation2ID++) {
        setState(() {
          overlayEntry2.remove();
          obiHeroOverlay(context, animation2ID);

          _position = _position + 35.0;
          if (_position > 128.0) {
            _position = 128.0;
          }
        });

        await Future.delayed(Duration(milliseconds: 75));
      }
    }

    // stand
    animationID = 0;
    animation2ID = 0;
    setState(() {
      overlayEntry.remove();
      anaHeroOverlay(context, animationID);

      overlayEntry2.remove();
      obiHeroOverlay(context, animation2ID);

      _counter--;
    });

    player2.play('speed.mp3');
  }

  void _colorCheck() {
    if (_counter > 0)
      color = Colors.blueAccent;
    else if (_counter < 0)
      color = Colors.redAccent;
    else
      color = Colors.grey;
  }

  _changeOpacity(String who) async {
    if (who == 'overlay') {
      await Future.delayed(Duration(seconds: 1));
      setState(() => _opacityLevel = _opacityLevel == 0 ? 1.0 : 0.0);
    }
    if (who == 'hero') {
      await Future.delayed(Duration(seconds: 1));
      setState(() => _heroOpacityLevel = _heroOpacityLevel == 0 ? 1.0 : 0.0);
    }
  }

  @override
  void initState() {
    super.initState();
    loadSprites();

    //rootNode = new NodeWithSize(const Size(63.0, 127.0));

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _controller2 = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _controller3 = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _controllerH = AnimationController(
      duration: Duration(seconds: 10),
      vsync: this,
    )..forward();

    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(0.0, -1.5),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _offsetAnimation2 = _offsetAnimation;

    /*_offsetAnimationJ = Tween<Offset>(
            begin: Offset.zero,
            end: Offset(0.0, 0.0),
          ).animate(CurvedAnimation(parent: _controllerJ, curve: Curves.easeInOut));*/

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

    final guitarHeroing = TweenSequence<Offset>([
      TweenSequenceItem<Offset>(
          tween: Tween<Offset>(begin: Offset.zero, end: Offset(1.5, -1.0)),
          weight: 2.0),
      TweenSequenceItem<Offset>(
          tween:
              Tween<Offset>(begin: Offset(1.5, -1.0), end: Offset(0.0, -2.0)),
          weight: 2.0),
      TweenSequenceItem<Offset>(
          tween:
              Tween<Offset>(begin: Offset(0.0, -2.0), end: Offset(1.5, -3.0)),
          weight: 2.0),
      TweenSequenceItem<Offset>(
          tween:
              Tween<Offset>(begin: Offset(1.5, -3.0), end: Offset(0.0, -4.0)),
          weight: 2.0),
      TweenSequenceItem<Offset>(
          tween:
              Tween<Offset>(begin: Offset(0.0, -4.0), end: Offset(1.5, -5.0)),
          weight: 2.0)
    ]);

    final guitarHeroing2 = TweenSequence<Offset>([
      TweenSequenceItem<Offset>(
          tween: Tween<Offset>(begin: Offset.zero, end: Offset(-1.5, -1.0)),
          weight: 2.0),
      TweenSequenceItem<Offset>(
          tween:
              Tween<Offset>(begin: Offset(-1.5, -1.0), end: Offset(0.0, -2.0)),
          weight: 2.0),
      TweenSequenceItem<Offset>(
          tween:
              Tween<Offset>(begin: Offset(0.0, -2.0), end: Offset(-1.5, -3.0)),
          weight: 2.0),
      TweenSequenceItem<Offset>(
          tween:
              Tween<Offset>(begin: Offset(-1.5, -3.0), end: Offset(0.0, -4.0)),
          weight: 2.0),
      TweenSequenceItem<Offset>(
          tween:
              Tween<Offset>(begin: Offset(0.0, -4.0), end: Offset(-1.5, -5.0)),
          weight: 2.0)
    ]);

    positionAnimation = alignSec
        .animate(CurvedAnimation(parent: _controllerH, curve: Curves.linear));
    positionAnimation2 = alignSec2
        .animate(CurvedAnimation(parent: _controllerH, curve: Curves.linear));

    /*_jumpAnimation = Tween<double>(begin: filterPos, end: filterPos)
              .animate(CurvedAnimation(parent: _controllerJ, curve: Curves.linear));*/

    postionGuitarAnimation = guitarHeroing
        .animate(CurvedAnimation(parent: _controller3, curve: Curves.linear));

    postionGuitarAnimation2 = guitarHeroing2
        .animate(CurvedAnimation(parent: _controller3, curve: Curves.linear));

    Future.delayed(Duration(milliseconds: 9275), () {
      player2.play('speed.mp3');
    });

    Future.delayed(Duration(seconds: 9), () {
      setState(() {
        //_offset = const Offset(0.0, -5.0);
        //showPointOverlay(context, MediaQuery.of(context).size.height/2.0, MediaQuery.of(context).size.width/2.0 + 30.0);
        _changeOpacity('hero');
      });
    });

    Future.delayed(Duration(milliseconds: 10020), () {
      //setState(() {

      anaHeroOverlay(context, animationID);
      obiHeroOverlay(context, animation2ID);

      //});
    });

    Future.delayed(Duration(milliseconds: 61950), () {
      showPointOverlay(context, 110.0, 0.0);
    });

    Future.delayed(Duration(milliseconds: 62950), () {
      //showOverlay3(context);
      setState(() {
        //_changeOpacity('overlay');
        _offsetAnimation = Tween<Offset>(
          begin: Offset.zero,
          end: Offset(0.0, -5.0),
        ).animate(
            CurvedAnimation(parent: _controller2, curve: Curves.easeInOut));
        _offsetAnimation2 = _offsetAnimation;
      });

      //Future.delayed(Duration(milliseconds: 47050), () { // ->
    });

    //});
    Future.delayed(Duration(seconds: 30), () {
      //showOverlay(context);
      setState(() {
        _offsetAnimation = Tween<Offset>(
          begin: Offset.zero,
          end: Offset(0.0, -3.0),
        ).animate(
            CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
        _offsetAnimation2 = _offsetAnimation;
      });
    });
    Future.delayed(Duration(seconds: 40 + 5), () {
      //showOverlay2(context);
    });

    Future.delayed(Duration(seconds: 70), () {
      //showOverlay4(context);
      /*setState(() {
              _offsetAnimation = postionGuitarAnimation;
              _offsetAnimation2 = postionGuitarAnimation2;
            });*/
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

  showPointOverlay(BuildContext context, double bottom, double right) async {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(
        builder: (context) => Positioned(
            bottom: bottom,
            right: right,
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

  loadSprites() {
    sprite0 = 'sprites/ana_standgreen-removebg-preview-final.png';
    sprite1 = 'sprites/ana_attack1_right_height-removebg-preview.png';
    sprite2 = 'sprites/ana_attack2_right_height2-removebg-preview.png';
    sprite3 = 'sprites/ana_attack3rightHeight-removebg-preview.png';
    sprite4A = 'sprites/row-1-col-1.png';
    sprite4B = 'sprites/row-1-col-2.png';
    sprite4C = 'sprites/row-1-col-3.png';
    sprite4D = 'sprites/row-1-col-4.png';
    sprite4E = 'sprites/row-1-col-5.png';
    sprite4F = 'sprites/row-1-col-6.png';
    sprite4G = 'sprites/row-1-col-7.png';
    sprite4H = 'sprites/row-1-col-8.png';
    sprite4I = 'sprites/row-1-col-9.png';
    sprite4J = 'sprites/ana_throwFinalFINAL.png';

    sprite5 = 'sprites/ana_special-removebg-preview.png';
    sprite50= 'sprites/ana_specialEnd-removebg-preview.png';

    sprite8 = 'sprites/ana_guard-removebg-preview.png';
    sprite9 = 'sprites/ana_guard2rightHeight-removebg-preview2.png';

    sprite0b = 'sprites/obi_stand_1_-removebg-preview-removebg-preview.png';
    sprite1b = 'sprites/obi_attack1final.png';
    sprite2b = 'sprites/obi_attack2rightHeightA-removebg-preview final.png';
    sprite3b = 'sprites/obi_attack3rightHeight-removebg-preview.png';

    sprite7bA = 'sprites/obi_flyrow-1-col-1.png';
    sprite7bB = 'sprites/obi_flyrow-1-col-2.png';
    sprite7bC = 'sprites/obi_flyrow-1-col-3.png';
    sprite7bD = 'sprites/obi_flyrow-1-col-4.png';
    sprite7bE = 'sprites/obi_flyrow-1-col-5.png';
    sprite7bF = 'sprites/obi_flyrow-1-col-6.png';
    sprite7bG = 'sprites/obi_flyrow-1-col-7.png';
    sprite7bH = 'sprites/obi_flyrow-1-col-8.png';
    sprite7bI = 'sprites/obi_flyrow-1-col-9.png';
    sprite7bJ = 'sprites/obi_flyrow-1-col-10.png';
    sprite7bK = 'sprites/obi_flyrow-1-col-11.png';
    sprite7bL = 'sprites/obi_flyrow-1-col-12.png';
    sprite7bM = 'sprites/obi_flyrow-1-col-13.png';
    sprite7bN = 'sprites/obi_flyrow-1-col-14.png';

    sprite8b = 'sprites/obi_guard_right_height-removebg-preview.png';
    sprite9b = 'sprites/obi_guard2rightHeight-removebg-preview.png';

    Flame.images.load(sprite0);
    Flame.images.load(sprite1);
    Flame.images.load(sprite2);
    Flame.images.load(sprite3);
    /*Sprite.loadSprite*/ Flame.images
        .load(sprite4A /*, width: 63.0, height: 182.0*/);
    /*Sprite.loadSprite*/ Flame.images
        .load(sprite4B /*, width: 63.0, height: 182.0*/);
    /*Sprite.loadSprite*/ Flame.images
        .load(sprite4C /*, width: 63.0, height: 182.0*/);
    /*Sprite.loadSprite*/ Flame.images
        .load(sprite4D /*, width: 63.0, height: 182.0*/);
    /*Sprite.loadSprite*/ Flame.images
        .load(sprite4E /*, width: 63.0, height: 182.0*/);
    /*Sprite.loadSprite*/ Flame.images
        .load(sprite4F /*, width: 63.0, height: 182.0*/);
    /*Sprite.loadSprite*/ Flame.images
        .load(sprite4G /*, width: 63.0, height: 182.0*/);
    /*Sprite.loadSprite*/ Flame.images
        .load(sprite4H /*, width: 63.0, height: 182.0*/);
    /*Sprite.loadSprite*/ Flame.images
        .load(sprite4I /*, width: 63.0, height: 182.0*/);
    Flame.images.load(sprite4J);

    Flame.images.load(sprite5);
    Flame.images.load(sprite50);
    Flame.images.load(sprite8);
    Flame.images.load(sprite9);

    Flame.images.load(sprite0b);
    Flame.images.load(sprite1b);
    Flame.images.load(sprite2b);
    Flame.images.load(sprite3b);
    //fly
    Flame.images.load(sprite7bA);
    Flame.images.load(sprite7bB);
    Flame.images.load(sprite7bC);
    Flame.images.load(sprite7bD);
    Flame.images.load(sprite7bE);
    Flame.images.load(sprite7bF);
    Flame.images.load(sprite7bG);
    Flame.images.load(sprite7bH);
    Flame.images.load(sprite7bI);
    Flame.images.load(sprite7bJ);
    Flame.images.load(sprite7bK);
    Flame.images.load(sprite7bL);
    Flame.images.load(sprite7bM);
    Flame.images.load(sprite7bN);

    Flame.images.load(sprite8b);
    Flame.images.load(sprite9b);
  }

  anaHeroOverlay(BuildContext context, int animationID) async {
    overlayState = Overlay.of(context);

    int width;
    int height;
    int columns;
    int rows = 1;
    double stepTime;
    bool loop = true;
    //bool _init = init;
    String sprite;
    //String spriteS;
    int _animationID = animationID;
    double filterPos;
    //bool translation = false;

    animation.Animation _animation;

    switch (_animationID) {
      case 1:
        sprite = sprite1;
        width = 131;
        height = 127;
        columns = 12;
        stepTime = 0.1;
        loop = false;
        attackTime = columns * stepTime;
        break;
      case 2:
        sprite = sprite2;
        width = 123;
        height = 167;
        columns = 8;
        stepTime = 0.1;
        loop = false;
        attackTime = columns * stepTime;
        break;
      case 3:
        sprite = sprite3;
        width = 125;
        height = 127;
        columns = 12;
        stepTime = 0.11;
        loop = false;
        attackTime = columns * stepTime;
        break;
      case 4: // throw
        sprite = sprite4J;
        width = 677;
        height = 136;
        columns = 11;
        rows = 1;
        stepTime = 0.1;
        loop = false;
        attackTime = rows * stepTime;
        break;
      case 5:
        sprite = sprite5;
        width = 91;
        height = 118;
        columns = 13;
        stepTime = 0.1;
        loop = false;
        attackTime = columns * stepTime;
        break;
        case 50:
        sprite = sprite50;
        width = 91;
        height = 118;
        columns = 1;
        stepTime = 1.3;
        loop = false;
        attackTime = columns * stepTime;
        break;
      case 8:
        sprite = sprite8;
        width = 64;
        height = 127;
        columns = 1;
        stepTime = attackTime;
        loop = false;
        break;
      case 9:
        sprite = sprite9;
        width = 52;
        height = 124;
        columns = 1;
        stepTime = attackTime;
        loop = false;
        break;
      case 0:
        sprite = sprite0;
        width = 86;
        height = 127;
        columns = 5;
        stepTime = 0.2;
        loop = true;
        attackTime = columns * stepTime;
        break;
    }

    if (_animationID > 39 && _animationID < 50) {
      width = 63;
      height = 182;
      columns = 1;
      stepTime = 0.1;
      loop = false;
      attackTime = columns * stepTime;

      //translation = true;
      /*_sprite = await Sprite.loadSprite(sprite4,
                  width: width.toDouble(), height: height.toDouble());*/

      switch (_animationID) {
        case 40:
          sprite = sprite4A;
          break;
        case 41:
          sprite = sprite4B;
          break;
        case 42:
          sprite = sprite4C;
          break;
        case 43:
          sprite = sprite4D;
          break;
        case 44:
          sprite = sprite4E;
          break;
        case 45:
          sprite = sprite4F;
          break;
        case 46:
          sprite = sprite4G;
          break;
        case 47:
          sprite = sprite4H;
          break;
        case 48:
          sprite = sprite4I;
          break;
      }
    }

    /*if (spriteS != null) {
            _sprite = Sprite(spriteS);
          }*/

    //if (sprite != null) {
    SpriteSheet _animationSpriteSheet = SpriteSheet(
      imageName: sprite,
      columns: columns,
      rows: rows,
      textureWidth: width,
      textureHeight: height,
    );

    _animation = _animationSpriteSheet.createAnimation(
      0,
      stepTime: stepTime,
      to: columns,
      loop: loop,
    );

    // ignore: deprecated_member_use
    /*Flame.util.animationAsWidget(
              Position(WIDTH, HEIGHT),
              animation.Animation.sequenced('ana_stand2-removebg-preview(2).png', AMOUNT,
                  textureWidth: 49.8));*/

    /*if (_init) {
            
          }*/

    filterPos = 128.0 + _position;

    if (filterPos < 0.0) {
      filterPos = 0.0;
    } else if (filterPos > MediaQuery.of(context).size.width - 123.0 - 33.0) {
      filterPos = MediaQuery.of(context).size.width - 123.0 - 33.0;
    }

    //init = true;

    overlayEntry = OverlayEntry(
        builder: (context) => Positioned(
            bottom: 360.0,
            left: filterPos,
            child:
                /*Positioned(
                        left: _jumpAnimation,
                        child:*/
                Container(
                    width: width.toDouble(),
                    height: height.toDouble(),
                    child: AnimationWidget(animation: _animation))));
    //}

    //if (!_init) {
    overlayState.insert(overlayEntry);
    //init = true;
    //} else{|
    //overlayEntry.remove();
    //overlayState.dispose();
    //overlayState.insert(overlayEntry);
    //}
    //}

    //await Future.delayed(Duration(seconds: 2));

    //overlayEntry.remove();
  }

  obiHeroOverlay(BuildContext context, int animation2ID) async {
    overlayState2 = Overlay.of(context);
    int width;
    int height;
    int columns;
    double stepTime;
    bool loop = true;
    String sprite;
    int _animationID = animation2ID;
    double filterPos;

    switch (_animationID) {
      case 1:
        sprite = sprite1b;
        width = 190;
        height = 127;
        columns = 16;
        stepTime = 0.1;
        loop = false;
        attackTime = columns * stepTime;
        break;
      case 2:
        sprite = sprite2b;
        width = 144;
        height = 130;
        columns = 19;
        stepTime = 0.1;
        loop = false;
        attackTime = columns * stepTime;
        break;
      case 3:
        sprite = sprite3b;
        width = 131;
        height = 127;
        columns = 10;
        stepTime = 0.12;
        loop = false;
        attackTime = columns * stepTime;
        break;
      case 8:
        sprite = sprite8b;
        width = 64;
        height = 127;
        columns = 1;
        stepTime = attackTime;
        loop = false;
        break;
      case 9:
        sprite = sprite9b;
        width = 70;
        height = 127;
        columns = 1;
        stepTime = attackTime;
        loop = false;
        break;
      case 0:
        sprite = sprite0b;
        width = 123;
        height = 127;
        columns = 5;
        stepTime = 0.2;
        loop = true;
        attackTime = columns * stepTime;
        break;
    }

    if (_animationID > 69) {
      width = 107;
      height = 130;
      columns = 1;
      stepTime = 0.1;
      loop = false;
      attackTime = columns * stepTime;

      switch (_animationID) {
        case 70:
          sprite = sprite7bA;
          break;
        case 71:
          sprite = sprite7bB;
          break;
        case 72:
          sprite = sprite7bC;
          break;
        case 73:
          sprite = sprite7bD;
          break;
        case 74:
          sprite = sprite7bE;
          break;
        case 75:
          sprite = sprite7bF;
          break;
        case 76:
          sprite = sprite7bG;
          break;
        case 77:
          sprite = sprite7bH;
          break;
        case 78:
          sprite = sprite7bI;
          break;
        case 79:
          sprite = sprite7bJ;
          break;
        case 80:
          sprite = sprite7bK;
          break;
        case 81:
          sprite = sprite7bL;
          break;
        case 82:
          sprite = sprite7bM;
          break;
        case 83:
          sprite = sprite7bN;
          break;
      }
    }

    final _animationSpriteSheet = SpriteSheet(
      imageName: sprite,
      columns: columns,
      rows: 1,
      textureWidth: width,
      textureHeight: height,
    );

    animation.Animation _animation = _animationSpriteSheet.createAnimation(0,
        stepTime: stepTime, to: columns, loop: loop);

    filterPos = MediaQuery.of(context).size.width - 128.0 - width + _position;

    if (filterPos > MediaQuery.of(context).size.width - width)
      filterPos = MediaQuery.of(context).size.width - width;
    else if (filterPos < 33.0) filterPos = 33.0;

    overlayEntry2 = OverlayEntry(
        builder: (context) => Positioned(
            bottom: 360.0,
            left: filterPos,
            child: Container(
                width: width.toDouble(),
                height: height.toDouble(),
                child: AnimationWidget(animation: _animation))));

    overlayState2.insert(overlayEntry2);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _controllerH.dispose();
    _controller2.dispose();
    _controller3.dispose();
    //_controllerJ.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _colorCheck();

    return /*MaterialApp(
              debugShowCheckedModeBanner: false,
              color: Colors.black,
              home:*/
        Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
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
      backgroundColor: Colors.black,
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
                    color: Colors.white,
                  ),
                )
              else if (_counter < 0)
                Text(
                  'The Dark Side the Force wins by:',
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.white,
                  ),
                )
              else
                Text(
                  'The Balance of the Force wins.',
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.white,
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
                  child: AnimatedOpacity(
                      opacity: _heroOpacityLevel,
                      duration: Duration(milliseconds: 100),
                      child:
                          Image.asset('assets/images/sprites/obi_base.png')));
            }),
        AnimatedBuilder(
            animation: _controllerH,
            builder: (BuildContext context, Widget child) {
              return Positioned(
                  left: positionAnimation2.value,
                  top: 347.0,
                  child: AnimatedOpacity(
                    opacity: _heroOpacityLevel,
                    duration: Duration(milliseconds: 100),
                    child: Image.asset(
                        'assets/images/sprites/ana_base2-removebg-preview.png'),
                  ));
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
                child: InkWell(
                  onLongPress: _decrementCounterS,
                  child: FloatingActionButton(
                    heroTag: "btn1",
                    backgroundColor: Colors.red,
                    onPressed: _decrementCounter,
                    //tooltip: 'Sith Rage',
                    child: Icon(Icons.remove),
                  ),
                )),
            FloatingActionButton(
              onPressed: _hello,
              backgroundColor: Colors.purple,
              tooltip: 'HELLO THERE!',
              child: Icon(Icons.music_note),
            ),
            SlideTransition(
              position: _offsetAnimation2,
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
