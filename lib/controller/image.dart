import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:image_picker/image_picker.dart';

import 'chatItems.dart';

Future<String?> pickImage(ImageSource imageSource) async {
  try {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);

    if (pickedFile != null) {
      isImage=true;
      return pickedFile.path;
    } else {
      return null;
      // User canceled the picker
    }
  } catch (e) {
    return  null;
    // Handle any errors
  }
}


Future<String> convertImageFileToBase64String(File imageFile) async {
  final bytes = await imageFile.readAsBytes();
  return base64Encode(bytes);
}

