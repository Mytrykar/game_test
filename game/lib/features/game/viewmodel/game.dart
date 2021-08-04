import 'dart:async';
import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:game/features/game/exception/add_excaption.dart';
import 'package:game/features/game/model/level_model.dart';
import 'package:game/features/game/model/timer_time_ago.dart';
import 'package:game/features/game/service/image_servise.dart';
import 'package:mobx/mobx.dart';

part 'game.g.dart';

///[Game] использувет три страницы, на екране отображается только одна
enum PageGame { start, game, end }

class Game = GameBase with _$Game;

abstract class GameBase with Store {
  late final ImageServise _servise = ImageServise();
  late LevelModel levelModel;
  late final Map<int, Item> _listEquatableItems = {};
  Timer? _timer;

  @action
  void init() {
    log("Game init");
    //добавляем модель по умолчанию
    levelModel = LevelModel.defaultLevels();
    listLevel.addAll(levelModel.listLevel);
  }

  ///используйте для отображение исключение ввода
  @observable
  late ExcaptionFill exteption = ExcaptionFill.none;

  ///Текущая страница в памяти
  @observable
  late PageGame page = PageGame.start;

  ///Имя выбранного изображения
  @observable
  late String currentImage = "";

  ///Выбрание изображение, исользуется для показа, в случае успешного прохождение
  ///игры
  @observable
  Image? image;

  ///Выбери уровень для отображение сетки поверх изображения
  @observable
  late int currentLevel = 0;

  ///Время потраченное на игру
  @observable
  late String timeAgo = "";

  ///Сколько еще осталось открыть ячеек
  @observable
  late int itemsLeft = 0;

  ///Масив чисел, [GameGrid] наблюдает за ним
  @observable
  ObservableList<Item> listItem = ObservableList<Item>.of([]);

  @observable
  ObservableList<Level> listLevel = ObservableList<Level>.of([]);

  @action
  void selectLevel(int index) {
    currentLevel = listLevel[index].level;
    listLevel
      ..clear()
      ..addAll(levelModel.listLevel)
      ..removeAt(index)
      ..insert(index, Level(isSelected: true, level: currentLevel));
  }

  ///Добавляет изображение в Store
  @action
  Future<void> addImage() async {
    await _servise.getImage();
    image = _servise.image;
    currentImage = _servise.image!.semanticLabel ?? "randomImage.png";
  }

  ///Проверяет все ли нужные значения заполнены, в случае успеха выполняет
  ///начальную инициализацию и открывает спраницу игры
  @action
  void starpGame() {
    exteption = GameDataExteption()
        .checkInputData(image: currentImage, setectLevel: currentLevel);
    if (exteption == ExcaptionFill.none) {
      page = PageGame.game;
      levelModel.generatedDefauiltItems(currentLevel: currentLevel);
      listItem.addAll(levelModel.listItems!);
      itemsLeft = listItem.length;
      _timer = Timer.periodic(const Duration(seconds: 1), (ticker) {
        timeAgo = TimerTimeAgo().durationTransform(ticker.tick);
      });
    }
  }

  ///Используется при нажатии на ячейку
  @action
  void updateBox(int index) {
    if (_listEquatableItems.length < 2 &&
        _listEquatableItems.containsKey(index) == false) {
      _listEquatableItems[index] = listItem[index];
      final _item =
          Item(StatusShow.selectItem, item: _listEquatableItems[index]!.item);
      listItem[index] = _item;

      if (_listEquatableItems.length == 2) {
        levelModel.statusShow(_listEquatableItems).then((value) async {
          if (value == StatusShow.showPicture) itemsLeft -= 2;

          for (var entrie in _listEquatableItems.entries) {
            listItem[entrie.key] = Item(value, item: entrie.value.item);
          }

          _listEquatableItems.clear();
          if (itemsLeft == 0) {
            _timer!.cancel();
            await Future.delayed(const Duration(seconds: 1));
            page = PageGame.end;
          }
        });
      }
    }
  }

  ///обнуляет рузультаты и начинает игру с начала
  void playAgain() {
    listItem.clear();
    timeAgo = "";
    itemsLeft = 0;
    starpGame();
  }

  ///обнуляет все, и возращает на начальную страницу
  void homePage() {
    listItem.clear();
    timeAgo = "";
    itemsLeft = 0;
    currentImage = "";
    currentLevel = 0;
    image = null;
    exteption = ExcaptionFill.none;
    listLevel
      ..clear()
      ..addAll(levelModel.listLevel);
    _listEquatableItems.clear();
    page = PageGame.start;
  }
}
