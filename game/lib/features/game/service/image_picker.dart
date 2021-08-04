import 'package:flutter/material.dart';

enum ImageType { widget }

class ImagePickerWeb {
  static Future<Object> getImage({required ImageType outputType}) async {
    return Image.network("https://source.unsplash.com/random/");
  }
}
