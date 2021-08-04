// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Game on GameBase, Store {
  final _$exteptionAtom = Atom(name: 'GameBase.exteption');

  @override
  ExcaptionFill get exteption {
    _$exteptionAtom.reportRead();
    return super.exteption;
  }

  @override
  set exteption(ExcaptionFill value) {
    _$exteptionAtom.reportWrite(value, super.exteption, () {
      super.exteption = value;
    });
  }

  final _$pageAtom = Atom(name: 'GameBase.page');

  @override
  PageGame get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(PageGame value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  final _$currentImageAtom = Atom(name: 'GameBase.currentImage');

  @override
  String get currentImage {
    _$currentImageAtom.reportRead();
    return super.currentImage;
  }

  @override
  set currentImage(String value) {
    _$currentImageAtom.reportWrite(value, super.currentImage, () {
      super.currentImage = value;
    });
  }

  final _$imageAtom = Atom(name: 'GameBase.image');

  @override
  Image? get image {
    _$imageAtom.reportRead();
    return super.image;
  }

  @override
  set image(Image? value) {
    _$imageAtom.reportWrite(value, super.image, () {
      super.image = value;
    });
  }

  final _$currentLevelAtom = Atom(name: 'GameBase.currentLevel');

  @override
  int get currentLevel {
    _$currentLevelAtom.reportRead();
    return super.currentLevel;
  }

  @override
  set currentLevel(int value) {
    _$currentLevelAtom.reportWrite(value, super.currentLevel, () {
      super.currentLevel = value;
    });
  }

  final _$timeAgoAtom = Atom(name: 'GameBase.timeAgo');

  @override
  String get timeAgo {
    _$timeAgoAtom.reportRead();
    return super.timeAgo;
  }

  @override
  set timeAgo(String value) {
    _$timeAgoAtom.reportWrite(value, super.timeAgo, () {
      super.timeAgo = value;
    });
  }

  final _$itemsLeftAtom = Atom(name: 'GameBase.itemsLeft');

  @override
  int get itemsLeft {
    _$itemsLeftAtom.reportRead();
    return super.itemsLeft;
  }

  @override
  set itemsLeft(int value) {
    _$itemsLeftAtom.reportWrite(value, super.itemsLeft, () {
      super.itemsLeft = value;
    });
  }

  final _$listItemAtom = Atom(name: 'GameBase.listItem');

  @override
  ObservableList<Item> get listItem {
    _$listItemAtom.reportRead();
    return super.listItem;
  }

  @override
  set listItem(ObservableList<Item> value) {
    _$listItemAtom.reportWrite(value, super.listItem, () {
      super.listItem = value;
    });
  }

  final _$listLevelAtom = Atom(name: 'GameBase.listLevel');

  @override
  ObservableList<Level> get listLevel {
    _$listLevelAtom.reportRead();
    return super.listLevel;
  }

  @override
  set listLevel(ObservableList<Level> value) {
    _$listLevelAtom.reportWrite(value, super.listLevel, () {
      super.listLevel = value;
    });
  }

  final _$addImageAsyncAction = AsyncAction('GameBase.addImage');

  @override
  Future<void> addImage() {
    return _$addImageAsyncAction.run(() => super.addImage());
  }

  final _$GameBaseActionController = ActionController(name: 'GameBase');

  @override
  void init() {
    final _$actionInfo =
        _$GameBaseActionController.startAction(name: 'GameBase.init');
    try {
      return super.init();
    } finally {
      _$GameBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectLevel(int index) {
    final _$actionInfo =
        _$GameBaseActionController.startAction(name: 'GameBase.selectLevel');
    try {
      return super.selectLevel(index);
    } finally {
      _$GameBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void starpGame() {
    final _$actionInfo =
        _$GameBaseActionController.startAction(name: 'GameBase.starpGame');
    try {
      return super.starpGame();
    } finally {
      _$GameBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateBox(int index) {
    final _$actionInfo =
        _$GameBaseActionController.startAction(name: 'GameBase.updateBox');
    try {
      return super.updateBox(index);
    } finally {
      _$GameBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
exteption: ${exteption},
page: ${page},
currentImage: ${currentImage},
image: ${image},
currentLevel: ${currentLevel},
timeAgo: ${timeAgo},
itemsLeft: ${itemsLeft},
listItem: ${listItem},
listLevel: ${listLevel}
    ''';
  }
}
