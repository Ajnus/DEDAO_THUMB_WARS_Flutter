import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:audioplayers/audio_cache.dart';
import 'dart:async';

class EndingPage extends StatefulWidget {
  @override
  _EndingPageState createState() => _EndingPageState();
}

class _EndingPageState extends State<EndingPage> {
  YoutubePlayerController _controller;

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

  @override
  void initState() {
    super.initState();

    showOverlay5(context);
    showOverlay6(context);
    
    _controller = YoutubePlayerController(
      initialVideoId: '4EtCGR2M_oU',
      flags: YoutubePlayerFlags(
        controlsVisibleAtStart: false,
        hideControls: true,
        hideThumbnail: true,
        autoPlay: true,
        //endAt: 69,
        mute: false,
        disableDragSeek: true,
        loop: false,
        isLive: false,
        forceHD: true,
        enableCaption: false,
      ),
    );
    /*..addListener(listener);
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;*/
  }

  /*void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }*/

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
