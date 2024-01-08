import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:google_gemini_flutter/api.dart';
import 'package:google_gemini_flutter/controller/google_gemini.dart';
import 'package:image_picker/image_picker.dart';

Future<String?> pickImage() async {
  try {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
        return pickedFile.path;
    } else {
      // User canceled the picker
    }
  } catch (e) {
    // Handle any errors
  }
}


Future<String> convertImageFileToBase64String(File imageFile) async {
  final bytes = await imageFile.readAsBytes();
  return base64Encode(bytes);
}

