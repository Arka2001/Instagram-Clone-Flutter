import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

pickImage(BuildContext context) async {
  final ImagePicker _picker = ImagePicker();

  XFile? image = await _picker.pickImage(source: ImageSource.gallery);

  if (image != null) {
    return await image.readAsBytes();
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('No image selected'),
      ),
    );
  }
}
