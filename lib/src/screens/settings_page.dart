import 'package:flutter/material.dart';

import 'package:frideos/frideos.dart';

import '../models/appstate.dart';
import '../models/models.dart';
import '../models/question.dart';
import '../models/theme.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

import '../internac/initialize_i18n.dart' show initializeI18n;
import '../internac/constant.dart' show languages;
import '../internac/localizations.dart'
    show MyLocalizations, MyLocalizationsDelegate;

class SettingsPage extends StatefulWidget {
  
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final countdownController = TextEditingController();
  final amountController = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    final appState = AppStateProvider.of<AppState>(context);

    countdownController.text =
        (appState.swBloc.countdown / 1000).toStringAsFixed(0);

    amountController.text = (appState.questionsAmount.value);

    List<Widget> _buildThemesList() {
      return appState.themes.map((MyTheme appTheme) {
        return DropdownMenuItem<MyTheme>(
          value: appTheme,
          child: Text(appTheme.name, style: const TextStyle(fontSize: 14.0)),
        );
      }).toList();
    }

    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Options',
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Theme:',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                ValueBuilder<MyTheme>(
                    streamed: appState.currentTheme,
                    builder: (context, snapshot) {
                      return DropdownButton<MyTheme>(
                        hint: const Text('Status'),
                        value: snapshot.data,
                        items: _buildThemesList(),
                        onChanged: appState.setTheme,
                      );
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Language:',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                ValueBuilder<ApiType>(
                    streamed: appState.apiType,
                    builder: (context, snapshot) {
                      return DropdownButton<ApiType>(
                          value: snapshot.data,
                          onChanged: appState.setApiType,
                          items: [
                            const DropdownMenuItem<ApiType>(
                              value: ApiType.mock,
                              child: Text('English'),
                            ),
                            const DropdownMenuItem<ApiType>(
                              value: ApiType.remote,
                              child: Text('Português'),
                            ),
                            const DropdownMenuItem<ApiType>(
                              value: ApiType.remote,
                              child: Text('Español'),
                            ),
                            const DropdownMenuItem<ApiType>(
                              value: ApiType.remote,
                              child: Text('Wookie'),
                            ),
                          ]);
                    }),
              ],
            ),
            ValueBuilder<ApiType>(
                streamed: appState.apiType,
                builder: (context, snapshot) {
                  return snapshot.data == ApiType.mock
                      ? Container()
                      : Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Difficulty:',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                ),
                                ValueBuilder<QuestionDifficulty>(
                                    streamed: appState.questionsDifficulty,
                                    builder: (context, snapshot) {
                                      return DropdownButton<QuestionDifficulty>(
                                          value: snapshot.data,
                                          onChanged: appState.setDifficulty,
                                          items: [
                                            const DropdownMenuItem<
                                                QuestionDifficulty>(
                                              value: QuestionDifficulty.easy,
                                              child: Text('Easy'),
                                            ),
                                            const DropdownMenuItem<
                                                QuestionDifficulty>(
                                              value: QuestionDifficulty.medium,
                                              child: Text('Medium'),
                                            ),
                                            const DropdownMenuItem<
                                                QuestionDifficulty>(
                                              value: QuestionDifficulty.hard,
                                              child: Text('Hard'),
                                            ),
                                          ]);
                                    }),
                              ],
                            ),
                          ],
                        );
                }),
          ],
        ),
      ),
    );
  }
}
