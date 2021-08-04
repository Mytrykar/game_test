import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:game/features/game/viewmodel/game.dart';
import 'package:game/generated/l10n.dart';
import 'package:provider/provider.dart';

class GameProgress extends StatelessWidget {
  const GameProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("${S.of(context).time}:"),
        Observer(builder: (context) {
          final timeAgo = context.watch<Game>().timeAgo;
          return Text(timeAgo);
        }),
        const Padding(padding: EdgeInsets.only(top: 30)),
        Text(S.of(context).items_left),
        Observer(
            builder: (BuildContext context) =>
                Text(context.watch<Game>().itemsLeft.toString()))
      ],
    );
  }
}
