import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:game/features/game/viewmodel/game.dart';
import 'package:provider/provider.dart';

class SelectImage extends StatelessWidget {
  const SelectImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            OutlinedButton(
                key: const Key("SeleckImageButton"),
                onPressed: context.read<Game>().addImage,
                child: Text(
                  "Select image...",
                  style: TextStyle(
                      color: Theme.of(context).textTheme.headline1!.color),
                )),
            Observer(builder: (context) {
              final text = context.watch<Game>().currentImage;
              if (text == "") {
                return const SizedBox();
              } else {
                return Text(
                  ".../${context.watch<Game>().currentImage}",
                  style: const TextStyle(color: Colors.green),
                );
              }
            })
          ],
        ),
      );
    });
  }
}
