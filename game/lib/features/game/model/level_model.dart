import 'dart:math';

import 'package:equatable/equatable.dart';

class LevelModel {
  final List<Level> listLevel;
  late List<Item>? listItems = [];
  LevelModel({required this.listLevel}) : assert(listLevel.length <= 6);

  factory LevelModel.defaultLevels() {
    const _list = <int>[16, 36, 64, 100, 196, 256];
    final _listLevel = List.generate(
        _list.length, (value) => Level(level: _list[value], isSelected: false));
    return LevelModel(listLevel: _listLevel);
  }

  void generatedDefauiltItems({required int currentLevel}) {
    if (listItems!.isNotEmpty) {
      listItems!.clear();
    }

    ///Проверить есть ли currentLevel в списке listLevel
    if (listLevel.contains(Level(level: currentLevel, isSelected: false)) ==
        false) {
      throw Exception("Елемент [$currentLevel] отсутствует в listLevel");
    }
    final list = List.generate(currentLevel, (index) => -1);
    for (int i = 0; list.contains(-1); i++) {
      for (int index = 0; index < 2; index++) {
        int random = Random().nextInt(list.length);
        if (list[random] != -1) random = list.indexOf(-1);
        list
          ..removeAt(random)
          ..insert(random, i);
      }
    }
    assert(list.any((element) => element >= 0));
    for (var item in list) {
      listItems!.add(Item(StatusShow.none, item: item));
    }
  }

  ///Ждет две секунды и проверяет добавленные числа в [listItem],
  ///если числа совпадают открывает две ячейки
  Future<StatusShow> statusShow(Map<int, Item> _listEquatableItems) async {
    await Future.delayed(const Duration(seconds: 2));
    final listIndex = _listEquatableItems.entries.toList();
    assert(listIndex.length == 2);

    if (listIndex[0].value == listIndex[1].value) {
      return StatusShow.showPicture;
    } else {
      return StatusShow.none;
    }
  }
}

enum StatusShow { none, showPicture, selectItem }

class Item extends Equatable {
  const Item(this.showPicture, {required this.item});

  final int item;
  final StatusShow showPicture;

  @override
  List<Object?> get props => [item, showPicture];
}

class Level extends Equatable {
  const Level({required this.level, required this.isSelected});
  final int level;
  final bool isSelected;
  @override
  List<Object?> get props => [level, isSelected];
}
