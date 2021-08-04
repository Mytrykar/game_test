import 'package:flutter/material.dart';
import 'package:game/features/game/view/pages/game.dart';
import 'package:game/generated/l10n.dart';
import 'package:theme_provider/theme_provider.dart';
import 'theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
        child: Builder(
      builder: (context) => MaterialApp(
        home: const GameView(),
        debugShowCheckedModeBanner: false,
        theme: ThemeProvider.themeOf(context).data,
        darkTheme: ThemeProvider.themeOf(context).data,
        title: "Game for web",
        themeMode: ThemeMode.system,
        localizationsDelegates: const [S.delegate],
        supportedLocales: const [Locale('en', 'US')],
      ),
    ));
  }
}
