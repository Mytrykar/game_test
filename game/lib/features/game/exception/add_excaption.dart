///Перечисление используются для показа исключение в случае не правильного
///ввода в HomePage.
enum ExcaptionFill { imageAndLevel, image, level, none }

///Имеет только четыре состояния.
class GameDataExteption {
  ExcaptionFill checkInputData(
      {required String image, required int setectLevel}) {
    if (image == "" && setectLevel == 0) {
      return ExcaptionFill.imageAndLevel;
    } else if (image != "" && setectLevel == 0) {
      return ExcaptionFill.level;
    } else if (image == "" && setectLevel != 0) {
      return ExcaptionFill.image;
    } else {
      return ExcaptionFill.none;
    }
  }
}
