import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:game/features/game/model/level_model.dart';
import 'package:game/features/game/viewmodel/game.dart';
import 'dart:math' as math;
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

class GameGrid extends StatelessWidget {
  const GameGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.topRight,
      child: SizedBox(
        height: 500,
        width: 500,
        child: ImageAndGridview(),
      ),
    );
  }
}

class ImageAndGridview extends StatelessWidget {
  const ImageAndGridview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      final game = context.read<Game>().listItem;
      return DecoratedBox(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: context.watch<Game>().image!.image, fit: BoxFit.cover)),
        child: GridView.count(
            children: List.generate(
                game.length,
                (index) => _Button(
                      index,
                      count: game[index],
                    )),
            crossAxisCount: math.sqrt(game.length).toInt()),
      );
    });
  }
}

class _Button extends StatelessWidget {
  final int index;
  final Item count;
  const _Button(this.index, {Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (count.showPicture) {
      case StatusShow.none:
        return InkWell(
          onTap: () => context.read<Game>().updateBox(index),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.grey[800] as Color),
            ),
          ),
        );
      case StatusShow.selectItem:
        return InkWell(
          onTap: () => context.read<Game>().updateBox(index),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.grey[800] as Color),
            ),
            child: Center(child: Text(count.item.toString())),
          ),
        );
      default:
        return const SizedBox();
    }
  }
}
