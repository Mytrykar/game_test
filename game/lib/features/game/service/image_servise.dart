import 'package:flutter/widgets.dart';
import 'package:image_picker_web/image_picker_web.dart'
    if (dart.library.io) "image_picker.dart"
    if (dart.library.js) 'package:image_picker_web/image_picker_web.dart';

class ImageServise {
  Image? image;

  ImageServise({this.image});

  Future<void> getImage() async {
    final response =
        await ImagePickerWeb.getImage(outputType: ImageType.widget);

    if (response is Image) image = response;
  }
}
