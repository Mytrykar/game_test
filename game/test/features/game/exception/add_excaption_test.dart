import 'package:flutter_test/flutter_test.dart';
import 'package:game/features/game/exception/add_excaption.dart';

void main() {
  group('Исключение ввода: ', () {
    late GameDataExteption inputExteption;
    setUp(() => inputExteption = GameDataExteption());
    test('Нажал старт но ничего не выбрал', () {
      final exteption =
          inputExteption.checkInputData(image: "", setectLevel: 0);
      expect(exteption, ExcaptionFill.imageAndLevel);
    });
    test('Нажал старт но выбрал только изображение', () {
      final exteption =
          inputExteption.checkInputData(image: "image.png", setectLevel: 0);
      expect(exteption, ExcaptionFill.level);
    });

    test('Нажал старт но выбрал только уровень', () {
      final exteption =
          inputExteption.checkInputData(image: "", setectLevel: 16);
      expect(exteption, ExcaptionFill.image);
    });
    test('Нажал старт, выбрал изображение и уровень', () {
      final exteption =
          inputExteption.checkInputData(image: "image.png", setectLevel: 16);
      expect(exteption, ExcaptionFill.none);
    });
  });
}
