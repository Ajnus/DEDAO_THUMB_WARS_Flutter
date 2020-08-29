import 'dart:async' show Future;
import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';
import 'constant.dart' show languages;

class MyLocalizations {
  final Map<String, Map<String, String>> localizedValues;
  MyLocalizations(this.locale, this.localizedValues);

  final Locale locale;

  static MyLocalizations of(BuildContext context) {
    return Localizations.of<MyLocalizations>(context, MyLocalizations);
  }

   String get poweredBy {
    return localizedValues[locale.languageCode]['powered by'];
  }
  String get startGame {
    return localizedValues[locale.languageCode]['Start Game'];
  }
  String get menu {
    return localizedValues[locale.languageCode]['Menu'];
  }
  String get options {
    return localizedValues[locale.languageCode]['Options'];
  }
  String get madeWithFlutter {
    return localizedValues[locale.languageCode]['Made with Flutter'];
  }
  String get chooseYourDestiny {
    return localizedValues[locale.languageCode]['Choose your Destiny'];
  }
  String get holdForBio {
    return localizedValues[locale.languageCode]['Hold for Bio'];
  }
  String get theme {
    return localizedValues[locale.languageCode]['Theme'];
  }
  String get ddefault {
    return localizedValues[locale.languageCode]['Default'];
  }
  String get dark {
    return localizedValues[locale.languageCode]['Hold for Bio'];
  }

}

class MyLocalizationsDelegate extends LocalizationsDelegate<MyLocalizations> {
  Map<String, Map<String, String>> localizedValues;

  MyLocalizationsDelegate(this.localizedValues);

  @override
  bool isSupported(Locale locale) => languages.contains(locale.languageCode);

  @override
  Future<MyLocalizations> load(Locale locale) {
    return SynchronousFuture<MyLocalizations>(
        MyLocalizations(locale, localizedValues));
  }

  @override
  bool shouldReload(MyLocalizationsDelegate old) => false;
}