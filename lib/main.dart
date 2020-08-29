import 'package:counter/src/game.dart';

import 'src/color.dart';
import 'src/IntroScreen.dart';
import 'dart:async';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vector_math/vector_math_64.dart';

import 'src/models/appstate.dart';
import 'package:frideos/frideos.dart';
import 'src/models/theme.dart';
import 'package:audio_recorder/audio_recorder.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
//import 'package:flutter_test/flutter_test.dart';

//import 'src/internac/initialize_i18n.dart' show initializeI18n;
import 'src/internac/constant.dart' show languages;
import 'src/internac/localizations.dart'
    show MyLocalizations, MyLocalizationsDelegate;

void main() async {
  //Map<String, Map<String, String>> localizedValues = await initializeI18n();
  //WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  //final Map<String, Map<String, String>> localizedValues;
  MyApp();

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _locale = 'en';

  onChangeLanguage() {
    if (_locale == 'en') {
      setState(() {
        _locale = 'pt';
      });
    } else if (_locale == 'pt') {
      setState(() {
        _locale = 'es';
      });
    } else {
      setState(() {
        _locale = 'en';
      });
    }
  }

  final appState = AppState();

  @override
  Widget build(BuildContext context) {
    return AppStateProvider<AppState>(
      appState: appState,
      child: MaterialPage(this.onChangeLanguage),
    );
  }
}

class MaterialPage extends StatelessWidget {
  final VoidCallback onChangeLanguage;
  MaterialPage(this.onChangeLanguage);

  @override
  Widget build(BuildContext context) {
    final theme = AppStateProvider.of<AppState>(context).currentTheme;
    return ValueBuilder<MyTheme>(
        streamed: theme,
        builder: (context, snapshot) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'D Wars',
              theme: _buildThemeData(snapshot.data),
              home: IntroScreen());
        });
  }

  ThemeData _buildThemeData(MyTheme appTheme) {
    return ThemeData(
      brightness: appTheme.brightness,
      backgroundColor: appTheme.backgroundColor,
      scaffoldBackgroundColor: appTheme.scaffoldBackgroundColor,
      primaryColor: primaryBlack,
      primaryColorBrightness: appTheme.primaryColorBrightness,
      accentColor: appTheme.accentColor,
    );
  }
}
