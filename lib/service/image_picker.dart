import 'dart:developer';

import 'package:image_picker/image_picker.dart';

import '../core/error/error.dart';

Future<XFile?> imagePickerHandelar() async {
  final ImagePicker picker = ImagePicker();

  try {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      return image;
    } else {
      log('No image selected.');
      return null;
    }
  } catch (e) {
    log('Error picking image: $e');
    throw AppError(code: 400, err: '$e');
  }
}
