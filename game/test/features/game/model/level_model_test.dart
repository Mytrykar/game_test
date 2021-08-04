import 'package:flutter_test/flutter_test.dart';
import 'package:game/features/game/model/level_model.dart';

void main() {
  group("Пользователь выбирает сложность: ", () {
    late LevelModel model = LevelModel.defaultLevels();

    test("Список сложностей по умолчанию", () {
      final list = model.listLevel;
      expectSync(list.length, 6);
    });

    test("Масив Элемент по умолчанию", () {
      var count = 16;
      final level = Level(level: count, isSelected: false);
      expect(model.listLevel.contains(level), true);

      model.generatedDefauiltItems(currentLevel: count);

      expect(model.listItems!.length, count);
    });

    test("Ожидание статуса если елементы не равны", () async {
      var level = <int, Item>{
        0: const Item(StatusShow.selectItem, item: 1),
        2: const Item(StatusShow.selectItem, item: 2),
      };
      final status = await model.statusShow(level);
      expectLater(status, StatusShow.none);
    });

    test("Ожидание статуса если елементы равны", () async {
      var level = <int, Item>{
        0: const Item(StatusShow.selectItem, item: 1),
        2: const Item(StatusShow.selectItem, item: 1),
      };

      final status = await model.statusShow(level);
      expect(status, StatusShow.showPicture);
    });
  });
}
