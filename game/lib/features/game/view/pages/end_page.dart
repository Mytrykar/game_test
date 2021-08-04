import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:game/features/game/view/widgets/adaptive_box.dart';
import 'package:game/features/game/view/widgets/button.dart';
import 'package:game/features/game/viewmodel/game.dart';
import 'package:game/generated/l10n.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

class EndPage extends StatelessWidget {
  const EndPage({Key? key}) : super(key: key);

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
    final text = S.of(context);
    return AdaptiveBox(
      maxsize: const Size(600, 500),
      minSize: const Size(200, 400),
      child: Column(
        children: [
          Text(
            text.congratulations,
            style: TextStyle(
                color: Theme.of(context).textTheme.headline1!.color,
                fontSize: 60,
                fontWeight: FontWeight.bold),
          ),
          const Padding(padding: EdgeInsets.only(top: 30)),
          Observer(builder: (context) {
            return Text(
              "${text.time_spend} : ${context.watch<Game>().timeAgo}",
              style: TextStyle(
                  color: Theme.of(context).textTheme.headline1!.color,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            );
          }),
          const Padding(padding: EdgeInsets.only(top: 30)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button(
                  onPressed: context.read<Game>().playAgain,
                  textColor: Theme.of(context).textTheme.headline1!.color,
                  text: text.play_again),
              const Padding(padding: EdgeInsets.only(right: 10)),
              Button(
                  onPressed: context.read<Game>().homePage,
                  textColor: Theme.of(context).textTheme.headline1!.color,
                  text: text.home_page),
            ],
          )
        ],
      ),
    );
  }
}
