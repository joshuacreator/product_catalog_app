import 'dart:io';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageService {
  static Future<File?> pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    return File(image!.path);
  }

  static Future<File?> cropImage(String image) async {
    final croppedImage = await ImageCropper().cropImage(sourcePath: image);
    return File(croppedImage!.path);
  }
}
