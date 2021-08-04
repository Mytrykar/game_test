import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:game/features/game/view/widgets/adaptive_box.dart';
import 'package:game/features/game/view/widgets/game_grid.dart';
import 'package:game/features/game/view/widgets/game_progress.dart';

class GamePage extends StatelessWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveBox(
        maxsize: const Size(800, 700),
        minSize: const Size(600, 500),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [GameProgress(), GameGrid()],
        ));
  }
}
