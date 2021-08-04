import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:game/features/game/exception/add_excaption.dart';
import 'package:game/features/game/view/widgets/adaptive_box.dart';
import 'package:game/features/game/view/widgets/button.dart';
import 'package:game/features/game/view/widgets/select_image.dart';
import 'package:game/features/game/view/widgets/select_level.dart';
import 'package:game/features/game/viewmodel/game.dart';
import 'package:game/generated/l10n.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = S.of(context);
    return AdaptiveBox(
        maxsize: const Size(500, 500),
        minSize: const Size(400, 400),
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Observer(builder: (context) {
                  final exception = context.watch<Game>().exteption;
                  if (exception == ExcaptionFill.image ||
                      exception == ExcaptionFill.imageAndLevel) {
                    return Text(
                      "${text.please_select_image_you_want_to_play} :",
                      style: const TextStyle(color: Colors.red),
                    );
                  }
                  return Text(
                    "${text.please_select_image_you_want_to_play} :",
                    style: const TextStyle(color: Colors.black),
                  );
                })),
            const Align(
                alignment: Alignment.center,
                child: SelectImage(
                  key: Key("SelectImage"),
                )),
            Align(
                alignment: Alignment.centerLeft,
                child: Observer(
                  builder: (context) {
                    final exception = context.watch<Game>().exteption;
                    if (exception == ExcaptionFill.level ||
                        exception == ExcaptionFill.imageAndLevel) {
                      return Text(
                        "${text.select_difficulty} :",
                        style: const TextStyle(color: Colors.red),
                      );
                    }
                    return Text(
                      "${text.select_difficulty} :",
                      style: const TextStyle(color: Colors.black),
                    );
                  },
                )),
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: SelectLevel(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Align(
                  alignment: Alignment.center,
                  child: Button(
                    key: const ValueKey("START_KEY"),
                    onPressed: () {
                      context.read<Game>().starpGame();
                    },
                    text: text.start,
                    textColor: Colors.black,
                  )),
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            const ExceptionGameReader()
          ],
        ));
  }
}

class ExceptionGameReader extends StatelessWidget {
  const ExceptionGameReader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle styleExeption = const TextStyle(color: Colors.red);
    return Observer(
      builder: (context) {
        final massage = S.of(context);
        final exception = context.watch<Game>().exteption;
        switch (exception) {
          case ExcaptionFill.image:
            return Text(massage.select_image_to_continue, style: styleExeption);
          case ExcaptionFill.imageAndLevel:
            return Text(massage.select_image_and_level_to_start_the_game,
                style: styleExeption);
          case ExcaptionFill.level:
            return Text(massage.select_a_level_to_continue,
                style: styleExeption);
          default:
            return const SizedBox();
        }
      },
    );
  }
}
