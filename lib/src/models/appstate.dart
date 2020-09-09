import 'dart:async';
import 'package:audioplayers/audio_cache.dart';
import 'package:counter/src/IntroScreen.dart';
import 'package:flutter/material.dart';
import 'package:frideos_core/frideos_core.dart';
import 'package:frideos/frideos.dart';
import '../API/api_interface.dart';
import '../API/mock_api.dart';
import '../API/trivia_api.dart';
import '../bloc/sw_bloc.dart';
import '../models/category.dart';
import '../models/models.dart';
import '../models/question.dart';
import '../models/theme.dart';

class AppState extends AppStateModel {
  factory AppState() => _singletonAppState;
  static AudioCache player2 = new AudioCache();
  static AudioCache player3 = new AudioCache();
  static AudioCache player4 = new AudioCache();
  static const blaster = "wpn_cis_blaster_fire.wav";
  static const blasthim = "Commander_Cody_blasts_him(cut).mp3";
  static const over = "You_underestimate_my_power(cut).mp3";
  //miscellaneous
  static const end = 'this is the end for you, my master(cut).mp3';
  static const only = 'only a sith.mp3';
  static const breathe = 'Spinclash(vader).mp3';
  static const palps = 'laughing.mp3';
  static const liar = 'liar!.mp3';

  AppState._internal() {
    print('-------APP STATE INIT--------');
    _createThemes(themes);
    _loadCategories();

    countdown.value = 10.toString();
    countdown.setTransformer(validateCountdown);

    questionsAmount.value = 5.toString();
    questionsAmount.setTransformer(validateAmount);

    swBloc = SWBloc(
        countdownStream: countdown,
        questions: questions,
        tabController: tabController);
  }

  static final AppState _singletonAppState = AppState._internal();

  // THEMES
  final themes = List<MyTheme>();
  final currentTheme = StreamedValue<MyTheme>();

  // API
  QuestionsAPI api = MockAPI();
  final apiType = StreamedValue<ApiType>(initialData: ApiType.mock);

  // TABS
  var tabController = StreamedValue<AppTab>(initialData: AppTab.main);

  // TRIVIA
  final categoriesStream = StreamedList<Category>();
  final categoryChosen = StreamedValue<Category>();
  final questions = StreamedList<Question>();
  final questionsDifficulty =
      StreamedValue<QuestionDifficulty>(initialData: QuestionDifficulty.medium);

  final questionsAmount = StreamedTransformed<String, String>();

  final validateAmount =
      StreamTransformer<String, String>.fromHandlers(handleData: (str, sink) {
    if (str.isNotEmpty) {
      final amount = int.tryParse(str);
      if (amount > 1 && amount <= 15) {
        sink.add(str);
      } else {
        sink.addError('Insert a value from 2 to 15..');
      }
    } else {
      sink.addError('Insert a value.');
    }
  });

  // BLOC
  SWBloc swBloc;

  // COUNTDOWN
  final countdown = StreamedTransformed<String, String>();

  final validateCountdown =
      StreamTransformer<String, String>.fromHandlers(handleData: (str, sink) {
    if (str.isNotEmpty) {
      final time = int.tryParse(str);
      if (time >= 3 && time <= 90) {
        sink.add(str);
      } else {
        sink.addError('Insert a value from 3 to 90 seconds.');
      }
    } else {
      sink.addError('Insert a value.');
    }
  });

  @override
  Future<void> init() async {
    final String lastTheme = await Prefs.getPref('apptheme');
    if (lastTheme != null) {
      currentTheme.value = themes.firstWhere((theme) => theme.name == lastTheme,
          orElse: () => themes[0]);
    } else {
      currentTheme.value = themes[0];
    }
  }

  Future _loadCategories() async {
    final isLoaded = await api.getCategories(categoriesStream);
    if (isLoaded) {
      categoryChosen.value = categoriesStream.value.last;
    }
  }

  /*Future _loadQuestions() async {
    await api.getQuestions(
        questions: questions,
        number: int.parse(questionsAmount.value),
        category: categoryChosen.value,
        difficulty: questionsDifficulty.value,
        type: QuestionType.multiple);
  }*/

  void setCategory(Category category) => categoryChosen.value = category;

  void setDifficulty(QuestionDifficulty difficulty) =>
      questionsDifficulty.value = difficulty;

  void setApiType(ApiType type) {
    if (apiType.value != type) {
      apiType.value = type;
      if (type == ApiType.mock) {
        api = MockAPI();
      } else {
        api = TriviaAPI();
      }
      _loadCategories();
    }
  }

  void _createThemes(List<MyTheme> themes) {
    themes.addAll([
      MyTheme(
        name: 'Default',
        brightness: Brightness.dark,
        backgroundColor: const Color(0xff111740),
        scaffoldBackgroundColor: const Color(0xff111740),
        primaryColor: const Color(0xff283593),
        primaryColorBrightness: Brightness.dark,
        accentColor: Colors.blue[300],
      ),
      MyTheme(
        name: 'Dark',
        brightness: Brightness.dark,
        backgroundColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.blueGrey[900],
        primaryColorBrightness: Brightness.dark,
        accentColor: Colors.blue[900],
      ),
    ]);
  }

  void setTheme(MyTheme theme) {
    currentTheme.value = theme;
    Prefs.savePref<String>('apptheme', theme.name);
  }

  set _changeTab(AppTab appTab) => tabController.value = appTab;

  void startGame() {
    player2.play(blaster);
    _changeTab = AppTab.choose;
  }

  void playGame() {
    player3.play(blasthim);

    _changeTab = AppTab.game;
    Future.delayed(Duration(seconds: 1), () {
      player4.play(over);
    });
    Future.delayed(Duration(seconds: 30), () {
      player2.play(end);
    });
    Future.delayed(Duration(seconds: 40 + 5), () {
      player3.play(only);
    });
    Future.delayed(Duration(seconds: 60), () {
      player3.play(liar);
    });
    Future.delayed(Duration(seconds: 70), () {
      player2.play(breathe);
    });
    Future.delayed(Duration(seconds: 80), () {
      player3.play(palps);
    });
  }

  void ending() {
    _changeTab = AppTab.ending;
  }

  void postCred() {
    _changeTab = AppTab.postcreds;
  }

  void endTrivia() => tabController.value = AppTab.main;

  void showSummary() => tabController.value = AppTab.summary;

  @override
  void dispose() {
    print('---------APP STATE DISPOSE-----------');
    apiType.dispose();
    categoryChosen.dispose();
    countdown.dispose();
    currentTheme.dispose();
    questions.dispose();
    questionsAmount.dispose();
    questionsDifficulty.dispose();
    tabController.dispose();
    swBloc.dispose();
  }
}
