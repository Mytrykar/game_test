import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:game/features/game/exception/add_excaption.dart';
import 'package:game/features/game/model/level_model.dart';
import 'package:game/features/game/view/widgets/adaptive_box.dart';
import 'package:game/features/game/viewmodel/game.dart';
import 'package:game/generated/l10n.dart';
import 'dart:math' as math;

import 'package:integration_test/integration_test.dart';
import 'package:mobx/mobx.dart' hide version;

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUp(() => mainContext.config =
      ReactiveConfig(writePolicy: ReactiveWritePolicy.never));

  tearDown(() => mainContext.config = ReactiveConfig.main);

  group("test App", () {
    test('Should expose the library\'s version', () {
      expect(version, isNotNull);
    });

    testWidgets('....', (WidgetTester tester) async {
      final game = Game();

      game.init();

      expect(game.listLevel.isNotEmpty, true);

      await tester.pumpWidget(MaterialApp(
        localizationsDelegates: const [S.delegate],
        supportedLocales: const [Locale('en', 'US')],
        home: Scaffold(
          backgroundColor: Colors.blue,
          body: Observer(
            builder: (context) {
              final text = S.of(context);
              if (game.page == PageGame.start) {
                return AdaptiveBox(
                    maxsize: const Size(500, 500),
                    minSize: const Size(400, 400),
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Observer(builder: (context) {
                              final text = S.of(context);
                              final exception = game.exteption;
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
                        Align(
                            alignment: Alignment.center,
                            child:
                                LayoutBuilder(builder: (context, constraints) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 20),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    OutlinedButton(
                                        key: const Key("SeleckImageButton"),
                                        onPressed: game.addImage,
                                        child: Text(
                                          "Select image...",
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .color),
                                        )),
                                    Observer(builder: (context) {
                                      final text = game.currentImage;
                                      if (text == "") {
                                        return const SizedBox();
                                      } else {
                                        return Text(
                                          ".../${game.currentImage}",
                                          style: const TextStyle(
                                              color: Colors.green),
                                        );
                                      }
                                    })
                                  ],
                                ),
                              );
                            })),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Observer(
                              builder: (context) {
                                final text = S.of(context);
                                final exception = game.exteption;
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
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(
                                  game.listLevel.length,
                                  (index) => Observer(builder: (context) {
                                        final level = game.listLevel[index];
                                        return OutlinedButton(
                                            key: Key("LevelButton$index"),
                                            style: ButtonStyle(
                                              side: MaterialStateProperty.all<
                                                      BorderSide>(
                                                  level.isSelected
                                                      ? const BorderSide(
                                                          color: Colors.black)
                                                      : const BorderSide(
                                                          color: Colors.grey)),
                                            ),
                                            onPressed: () {
                                              game.selectLevel(index);
                                            },
                                            child: Text(
                                              "${level.level}",
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .headline1!
                                                      .color),
                                            ));
                                      })),
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: Align(
                                alignment: Alignment.center,
                                child: OutlinedButton(
                                    key: const ValueKey("START_KEY"),
                                    style: ButtonStyle(
                                        side:
                                            MaterialStateBorderSide.resolveWith(
                                                (states) => const BorderSide(
                                                    color: Colors.grey))),
                                    onPressed: () {
                                      game.starpGame();
                                    },
                                    child: const Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "start",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 30),
                                        ))))),
                        const Padding(padding: EdgeInsets.only(top: 20)),
                        Observer(
                          builder: (context) {
                            TextStyle styleExeption =
                                const TextStyle(color: Colors.red);
                            final massage = S.of(context);
                            final exception = game.exteption;
                            switch (exception) {
                              case ExcaptionFill.image:
                                return Text(massage.select_image_to_continue,
                                    style: styleExeption);
                              case ExcaptionFill.imageAndLevel:
                                return Text(
                                    massage
                                        .select_image_and_level_to_start_the_game,
                                    style: styleExeption);
                              case ExcaptionFill.level:
                                return Text(massage.select_a_level_to_continue,
                                    style: styleExeption);
                              default:
                                return const SizedBox();
                            }
                          },
                        )
                      ],
                    ));
              } else if (game.page == PageGame.game) {
                return AdaptiveBox(
                    maxsize: const Size(800, 700),
                    minSize: const Size(600, 500),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("${S.of(context).time}:"),
                            Observer(builder: (context) {
                              final timeAgo = game.timeAgo;
                              return Text(timeAgo);
                            }),
                            const Padding(padding: EdgeInsets.only(top: 30)),
                            Text(S.of(context).items_left),
                            Observer(
                                builder: (BuildContext context) =>
                                    Text(game.itemsLeft.toString()))
                          ],
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: SizedBox(
                            height: 500,
                            width: 500,
                            child: Observer(builder: (_) {
                              final _game = game.listItem;
                              return DecoratedBox(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: game.image!.image,
                                        fit: BoxFit.cover)),
                                child: GridView.count(
                                    children:
                                        List.generate(_game.length, (index) {
                                      switch (_game[index].showPicture) {
                                        case StatusShow.none:
                                          return InkWell(
                                            key: Key("CountBox$index"),
                                            onTap: () => game.updateBox(index),
                                            child: DecoratedBox(
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                border: Border.all(
                                                    color: Colors.grey[800]
                                                        as Color),
                                              ),
                                            ),
                                          );
                                        case StatusShow.selectItem:
                                          return InkWell(
                                            onTap: () => game.updateBox(index),
                                            child: DecoratedBox(
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                border: Border.all(
                                                    color: Colors.grey[800]
                                                        as Color),
                                              ),
                                              child: Center(
                                                  child: Text(_game[index]
                                                      .item
                                                      .toString())),
                                            ),
                                          );
                                        default:
                                          return const SizedBox();
                                      }
                                    }),
                                    crossAxisCount:
                                        math.sqrt(_game.length).toInt()),
                              );
                            }),
                          ),
                        )
                      ],
                    ));
              } else {
                return Scaffold(
                  body: AdaptiveBox(
                    maxsize: const Size(600, 500),
                    minSize: const Size(200, 400),
                    child: Column(
                      children: [
                        Text(
                          text.congratulations,
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.headline1!.color,
                              fontSize: 60,
                              fontWeight: FontWeight.bold),
                        ),
                        const Padding(padding: EdgeInsets.only(top: 30)),
                        Observer(builder: (context) {
                          return Text(
                            "${text.time_spend} : ${game.timeAgo}",
                            style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .color,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          );
                        }),
                        const Padding(padding: EdgeInsets.only(top: 30)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            OutlinedButton(
                                key: const Key("playAgain"),
                                style: ButtonStyle(
                                    side: MaterialStateBorderSide.resolveWith(
                                        (states) => const BorderSide(
                                            color: Colors.grey))),
                                onPressed: game.playAgain,
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      text.play_again,
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .textTheme
                                              .headline1!
                                              .color,
                                          fontSize: 30),
                                    ))),
                            OutlinedButton(
                                key: const Key("home_page"),
                                style: ButtonStyle(
                                    side: MaterialStateBorderSide.resolveWith(
                                        (states) => const BorderSide(
                                            color: Colors.grey))),
                                onPressed: game.homePage,
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      text.home_page,
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .textTheme
                                              .headline1!
                                              .color,
                                          fontSize: 30),
                                    )))
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ));

      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const ValueKey("START_KEY")));

      expect(game.exteption, ExcaptionFill.imageAndLevel);

      await tester.pump(const Duration(seconds: 2));

      game.image = Image.network("https://source.unsplash.com/random/");
      game.currentImage = "image.png";

      await tester.tap(find.byKey(const ValueKey("START_KEY")));

      expect(game.exteption, ExcaptionFill.level);

      await tester.pump(const Duration(seconds: 2));

      await tester.tap(find.byKey(const Key("LevelButton0")));

      expect(game.currentLevel, 16);

      expect(game.currentLevel == 16 && game.currentImage == "image.png", true);

      await tester.pump(const Duration(seconds: 1));

      await tester.tap(find.byKey(const ValueKey("START_KEY")));

      expect(game.page, PageGame.game);

      await tester.pump(const Duration(seconds: 2));

      for (int ii = 0; ii < game.listItem.length; ii++) {
        final item = game.listItem[ii];

        if (item.showPicture != StatusShow.showPicture &&
            item.showPicture == StatusShow.none) {
          await tester.tap(find.byKey(Key("CountBox$ii")));
          await tester.pump(const Duration(seconds: 1));
          int twoCount = 0;
          for (twoCount; twoCount < game.listItem.length; twoCount++) {
            final _item = game.listItem[twoCount];
            if (_item.item == item.item && ii != twoCount) break;
          }
          await tester.tap(find.byKey(Key("CountBox$twoCount")));
          await tester.pump(const Duration(seconds: 3));
        }
      }

      expect(game.page, PageGame.end);

      await tester.pump(const Duration(seconds: 5));

      await tester.tap(find.byKey(const Key("playAgain")));

      expect(game.listItem.length, game.currentLevel);

      expect(game.page, PageGame.game);

      await tester.pump(const Duration(seconds: 1));

      for (int ii = 0; ii < game.listItem.length; ii++) {
        final item = game.listItem[ii];

        if (item.showPicture != StatusShow.showPicture &&
            item.showPicture == StatusShow.none) {
          await tester.pump(const Duration(seconds: 3));
          await tester.tap(find.byKey(Key("CountBox$ii")));
          await tester.pump(const Duration(seconds: 1));
          int twoCount = 0;
          for (twoCount; twoCount < game.listItem.length; twoCount++) {
            final _item = game.listItem[twoCount];
            if (_item.item == item.item && ii != twoCount) break;
          }
          await tester.tap(find.byKey(Key("CountBox$twoCount")));
          await tester.pump(const Duration(seconds: 3));
        }
      }

      expect(game.page, PageGame.end);

      await tester.pump(const Duration(seconds: 5));

      await tester.tap(find.byKey(const Key("home_page")));

      await tester.pump(const Duration(seconds: 5));

      expect(game.currentImage, "");

      expect(game.currentLevel, 0);

      expect(game.image, null);

      expect(game.page, PageGame.start);

      await tester.tap(find.byKey(const ValueKey("START_KEY")));

      expect(game.exteption, ExcaptionFill.imageAndLevel);

      await tester.pump(const Duration(seconds: 2));

      game.image = Image.network("https://source.unsplash.com/random/");
      game.currentImage = "image.png";

      await tester.tap(find.byKey(const ValueKey("START_KEY")));

      expect(game.exteption, ExcaptionFill.level);

      await tester.pump(const Duration(seconds: 2));

      await tester.tap(find.byKey(const Key("LevelButton1")));

      expect(game.currentLevel, 36);

      expect(
          game.currentLevel == 36 && game.currentImage == "dh35h34h.png", true);

      await tester.pump(const Duration(seconds: 1));

      await tester.tap(find.byKey(const ValueKey("START_KEY")));

      expect(game.page, PageGame.game);

      await tester.pump(const Duration(seconds: 2));

      for (int ii = 0; ii < game.listItem.length; ii++) {
        final item = game.listItem[ii];

        if (item.showPicture != StatusShow.showPicture &&
            item.showPicture == StatusShow.none) {
          await tester.pump(const Duration(seconds: 3));
          await tester.tap(find.byKey(Key("CountBox$ii")));
          await tester.pump(const Duration(seconds: 1));
          int twoCount = 0;
          for (twoCount; twoCount < game.listItem.length; twoCount++) {
            final _item = game.listItem[twoCount];
            if (_item.item == item.item && ii != twoCount) break;
          }
          await tester.tap(find.byKey(Key("CountBox$twoCount")));
          await tester.pump(const Duration(seconds: 3));
        }
      }

      expect(game.page, PageGame.end);

      await tester.pump(const Duration(seconds: 5));
    });
  });
}
