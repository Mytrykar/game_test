import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:game/features/game/view/pages/start_page.dart';
import 'package:game/features/game/viewmodel/game.dart';
import 'package:provider/provider.dart';

import 'end_page.dart';
import 'game_page.dart';

class GameView extends StatelessWidget {
  const GameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<Game>(
      create: (context) => Game()..init(),
      child: const _SelectPage(
        key: Key("_SelectPage"),
      ),
    );
  }
}

class _SelectPage extends StatelessWidget {
  const _SelectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      final currentPage = context.watch<Game>().page;
      if (currentPage == PageGame.start) {
        return const StartPage(
          key: Key("StartPage"),
        );
      } else if (currentPage == PageGame.game) {
        return const GamePage(
          key: Key("GamePage"),
        );
      } else {
        return const EndPage(
          key: Key("EndPage"),
        );
      }
    });
  }
}
