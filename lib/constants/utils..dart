import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}

Future<List<File>> pickImages() async {
  List<File> images = [];
  final imagepicker = ImagePicker();
  try {
    var files = await imagepicker.pickMultiImage();
    if (files != null && files.isNotEmpty) {
      for (int i = 0; i < files.length; i++) {
        images.add(File(files[i].path));
      }
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  return images;
}
