
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RecipeIngreController extends GetxController{
  XFile? _file;
  XFile? get file => _file;

  File? _image;
  File? get image => _image;
  
  changeVideoFile(XFile? receivedFile){
    _file = receivedFile;
    update();
  }

  changeImageFile(File? receivedImage){
    _image = receivedImage;
    update();
  }
}