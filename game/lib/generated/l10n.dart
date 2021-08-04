// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Congratulations`
  String get congratulations {
    return Intl.message(
      'Congratulations',
      name: 'congratulations',
      desc: '',
      args: [],
    );
  }

  /// `Please select image you want to play`
  String get please_select_image_you_want_to_play {
    return Intl.message(
      'Please select image you want to play',
      name: 'please_select_image_you_want_to_play',
      desc: '',
      args: [],
    );
  }

  /// `Time spend`
  String get time_spend {
    return Intl.message(
      'Time spend',
      name: 'time_spend',
      desc: '',
      args: [],
    );
  }

  /// `Play again`
  String get play_again {
    return Intl.message(
      'Play again',
      name: 'play_again',
      desc: '',
      args: [],
    );
  }

  /// `Home page`
  String get home_page {
    return Intl.message(
      'Home page',
      name: 'home_page',
      desc: '',
      args: [],
    );
  }

  /// `Select difficulty`
  String get select_difficulty {
    return Intl.message(
      'Select difficulty',
      name: 'select_difficulty',
      desc: '',
      args: [],
    );
  }

  /// `Select image to continue`
  String get select_image_to_continue {
    return Intl.message(
      'Select image to continue',
      name: 'select_image_to_continue',
      desc: '',
      args: [],
    );
  }

  /// `Select image and level to start the game`
  String get select_image_and_level_to_start_the_game {
    return Intl.message(
      'Select image and level to start the game',
      name: 'select_image_and_level_to_start_the_game',
      desc: '',
      args: [],
    );
  }

  /// `Select a level to continue`
  String get select_a_level_to_continue {
    return Intl.message(
      'Select a level to continue',
      name: 'select_a_level_to_continue',
      desc: '',
      args: [],
    );
  }

  /// `Good game`
  String get good_game {
    return Intl.message(
      'Good game',
      name: 'good_game',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get time {
    return Intl.message(
      'Time',
      name: 'time',
      desc: '',
      args: [],
    );
  }

  /// `Items left`
  String get items_left {
    return Intl.message(
      'Items left',
      name: 'items_left',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get start {
    return Intl.message(
      'Start',
      name: 'start',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
