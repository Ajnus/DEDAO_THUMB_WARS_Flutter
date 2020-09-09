import 'package:audioplayers/audioplayers.dart';
import 'package:counter/src/color.dart';
import 'package:flutter/services.dart';
import 'ending.dart';
import 'game.dart';
import 'choose.dart';
import 'postcred.dart';
import 'LandingPage.dart';
import 'dart:async';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vector_math/vector_math_64.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
        debugShowCheckedModeBanner: false,
        color: Color(0xFF000000),
        builder: (context, _) => CrawlPage(),
        routes: <String, WidgetBuilder>{
          '/choose': (BuildContext context) => ChoosePage(),
        });
  }
}

class CrawlPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Flexible(
        flex: 5,
        child: Perspective(child: Crawler()),
      ),
      Flexible(
        flex: 1,
        child: Column(),
      ),
    ]);
  }
}

class Crawler extends StatefulWidget {
  final crawlDuration = const Duration(seconds: 50);

  @override
  _CrawlerState createState() => _CrawlerState();
}

class _CrawlerState extends State<Crawler> {
  final _scrollController = ScrollController();
  final AudioCache background = new AudioCache();
  static const intromusic = "Star_Wars_Soundtrack(cut).mp3";

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    Future.delayed(
        const Duration(milliseconds: 500),
        () => _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: widget.crawlDuration,
            curve: Curves.linear));
    Future.delayed(
      const Duration(seconds: 1),
      () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => PostCreditsPage())),
    );
    /*Future.delayed(Duration(seconds: 3), () {
      background.play(intromusic);
    });*/

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/choose');
      },
      child: ListView(
        controller: _scrollController,
        children: [
          SizedBox(height: height),
          Text(
            """DEDÃo WARS""",
            style: TextStyle(
                fontFamily: 'StarJedi', color: Color(0xFFFFFF00), fontSize: 24),
            textAlign: TextAlign.center,
          ),
          Text(
            """\n\n\n\n\n\n\npowered by:\n""",
            style: TextStyle(
                fontFamily: 'StarJedi', color: Color(0xFFFFFF00), fontSize: 24),
            textAlign: TextAlign.center,
          ),
          FlutterLogo(size: width / 1.5),
          SizedBox(height: height - 190),
          Center(
              child: Text("Ajna's Enterprise Studios ©",
                  style: new TextStyle(
                    fontSize: 10.0,
                    fontFamily: 'Inconsolata',
                    color: new Color(0xFF00FF00),
                  ))),
          MyBlinkingButton(),
        ],
      ),
    ));
  }
}

class Perspective extends StatelessWidget {
  Perspective({this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.002)
        ..rotateX(-3.14 / 3.5),
      alignment: FractionalOffset.center,
      child: child,
    );
  }
}

class MyBlinkingButton extends StatefulWidget {
  @override
  _MyBlinkingButtonState createState() => _MyBlinkingButtonState();
}

class _MyBlinkingButtonState extends State<MyBlinkingButton>
    with TickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animationController.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) =>
            /*GestureDetector(
         onTap: () {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Choose()),
            );},
      child:*/
            FadeTransition(
              opacity: _animationController,
              child: MaterialButton(
                color: Color(0xFFFFFF00),
                onPressed: () {
                  //Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChoosePage()),
                  );
                },
                child: Text(
                  "Start Game",
                  style: TextStyle(color: primaryBlack),
                ),
              ),
            ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
