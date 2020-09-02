import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:audioplayers/audio_cache.dart';
import 'dart:async';

class EndingPage extends StatefulWidget {
  @override
  _EndingPageState createState() => _EndingPageState();
}

class _EndingPageState extends State<EndingPage> with TickerProviderStateMixin {
  YoutubePlayerController _controller;
  AnimationController _controller2;
  //AnimationController _controller2A;

  //Duration _currentPosition;

  PlayerState _playerState;
  YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = true;

  showOverlay5(BuildContext context) async {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(
        /*opaque: true,*/ builder: (context) => Positioned(
            bottom: 0.0,
            left: 0.0,
            child: Image.asset('assets/images/black tie.png')));

    overlayState.insert(overlayEntry);

    await Future.delayed(Duration(seconds: 1));

    overlayEntry.remove();
  }

  showOverlay6(BuildContext context) async {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(
        /*opaque: true,*/ builder: (context) => Positioned(
            top: 0.0,
            left: 0.0,
            child: Image.asset('assets/images/black tie.png')));

    overlayState.insert(overlayEntry);

    await Future.delayed(Duration(seconds: 1));

    overlayEntry.remove();
  }

  _closeScreenOverlay(BuildContext context) {
    //_controller.dispose();
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(
        /*opaque: true,*/ builder: (context) {
      return LayoutBuilder(
        builder: (context, constraints) {
          final Size biggest = constraints.biggest;
          //_printaAltura();

          return Stack(
            children: [
              PositionedTransition(
                rect: RelativeRectTween(
                  begin: RelativeRect.fromSize(
                      Rect.fromLTWH(-113, -1022, 1107, 169), biggest),
                  end: RelativeRect.fromSize(
                      Rect.fromLTWH(-113, 77, 1107, 129), biggest),
                ).animate(CurvedAnimation(
                    parent: _controller2, curve: Curves.linear)),
                child:
                    /*Padding(
                    padding: const EdgeInsets.all(8),
                    child:*/
                    Image.asset('assets/images/black tie extended.png'),
              ),
              PositionedTransition(
                rect: RelativeRectTween(
                  begin: RelativeRect.fromSize(
                      Rect.fromLTWH(
                          -116,
                          MediaQuery.of(context).size.height - 77 + 970,
                          1107,
                          129),
                      biggest),
                  end: RelativeRect.fromSize(
                      Rect.fromLTWH(
                          -116,
                          (MediaQuery.of(context).size.height / 2.0),
                          1107,
                          129),
                      biggest),
                ).animate(CurvedAnimation(
                    parent: _controller2, curve: Curves.linear)),
                child:
                    /*Padding(
                  padding: const EdgeInsets.all(8),
                  child:*/
                    Image.asset('assets/images/black tie extended.png'),
                //),
              ),
            ],
          );
        },
      );
    });

    //await Future.delayed(Duration(seconds: 71));
    overlayState.insert(overlayEntry);
    /*await Future.delayed(Duration(seconds: 1));
      await Future.delayed(Duration(seconds: 1));

      overlayEntry.remove();*/ // { ( { ( { ( [
  }

  @override
  void initState() {
    super.initState();

    showOverlay5(context);
    showOverlay6(context);
    /*Future.delayed(Duration(seconds: 71), () {
      _closeScreenOverlay(context);
    });*/

    _controller2 = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )
      ..forward();
      //..addListener((listenerOG));

    /*_controller2A = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )
      ..repeat(reverse: true)
      ..addStatusListener((completed) {
        _controller2A.stop();
      });*/

    _controller = YoutubePlayerController(
        initialVideoId: '4EtCGR2M_oU',
        flags: YoutubePlayerFlags(
          controlsVisibleAtStart: false,
          hideControls: true,
          hideThumbnail: true,
          autoPlay: true,
          endAt: 71,
          mute: false,
          disableDragSeek: true,
          loop: false,
          isLive: false,
          forceHD: true,
          enableCaption: false,
        ))
      ..addListener(listener);
    //_videoMetaData = const YoutubeMetaData();
    //_playerState = PlayerState.unknown;
  }

  void listener() {
    setState(() {
      //_playerState = _controller.value.playerState;
      if (_controller.value.position.inSeconds == 70) {
        int position = _controller.value.position.inSeconds;
        print('*** ENTROU! A POSICAO E:');
        print('$position ***');
        _closeScreenOverlay(context);
      }
    });
  }

  /*void listenerOG() {
      if (_controller2.status == AnimationStatus.completed) {
        print('********* PARÔ! *********');
        _controller2.stop();
      }
  }*/

  /*void listener() async{
    await Future.delayed(Duration(seconds: 10));
    if (!_controller.value.isPlaying) {
      
    }
  }*/

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _controller2.dispose();
    //_controller2A.dispose();
  }

  _printaAltura() {
    double tam = MediaQuery.of(context).size.height;
    print('TAMANHO: $tam');
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
    return YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: false,
          //onEnded: _closeScreenOverlay(context),
          topActions: <Widget>[
            const SizedBox(width: 8.0),
            Expanded(
              child: Text(
                _controller.metadata.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
          onReady: () {
            _isPlayerReady = true;
          },
          //onEnded: // implementar
        ),
        builder: (context, player) {
          return Column(
            children: [
              // some widgets
              player,
              //some other widgets
            ],
          );
        });
  }
}
