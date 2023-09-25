
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RecipeIngreController extends GetxController{
  XFile? _file;
  XFile? get file => _file;

  File? _image;
  File? get image => _image;

  

  List<String> _tags = [];
  List<String> get tags => _tags;

  List<String> _tagsSearch = [];
  List<String> get tagsSearch => _tagsSearch;

  addTags(String text){
    // _tags = [];
    _tags.add('"$text"');
    update();
  }

  removeTags(String text){
    _tags.remove('"$text"');
    update();
  }

  addTagsSearch(String text){
    // _tags = [];
    _tagsSearch.add(text);
    update();
  }

  removeTagsSearch(String text){
    _tagsSearch.remove(text);
    print(_tagsSearch);
    update();
  }

  emptyTags(){
    _tagsSearch.clear();
  }
  
  changeVideoFile(XFile? receivedFile){
    _file = receivedFile;
    update();
  }

  changeImageFile(File? receivedImage){
    _image = receivedImage;
    update();
  }
}