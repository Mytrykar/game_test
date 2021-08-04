import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:game/features/game/viewmodel/game.dart';
import 'package:provider/provider.dart';

class SelectLevel extends StatelessWidget {
  const SelectLevel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(context.watch<Game>().listLevel.length,
              (index) => LevelButton(index)),
        ),
      );
    });
  }
}

class LevelButton extends StatelessWidget {
  final int index;
  const LevelButton(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      final level = context.watch<Game>().listLevel[index];
      return OutlinedButton(
          key: Key("LevelButton$index"),
          style: ButtonStyle(
            side: MaterialStateProperty.all<BorderSide>(level.isSelected
                ? const BorderSide(color: Colors.black)
                : const BorderSide(color: Colors.grey)),
          ),
          onPressed: () {
            context.read<Game>().selectLevel(index);
          },
          child: Text(
            "${level.level}",
            style:
                TextStyle(color: Theme.of(context).textTheme.headline1!.color),
          ));
    });
  }
}
