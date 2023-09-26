class SearchDefaultModel {
  SearchDefaultModel({
    required this.success,
    required this.message,
    required this.category,
    required this.tags,
    required this.pularSearch,
  });
  late final bool success;
  late final String message;
  late final List<Category> category;
  late final List<String> tags;
  late final List<PularSearch> pularSearch;
  
  SearchDefaultModel.fromJson(Map<String, dynamic> json){
    success = json['success'];
    message = json['message'];
    category = List.from(json['category']).map((e)=>Category.fromJson(e)).toList();
    tags = List.castFrom<dynamic, String>(json['tags']);
    pularSearch = List.from(json['pularSearch']).map((e)=>PularSearch.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['message'] = message;
    _data['category'] = category.map((e)=>e.toJson()).toList();
    _data['tags'] = tags;
    _data['pularSearch'] = pularSearch.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Category {
  Category({
    required this.category,
    required this.coverImage,
  });
  late final String category;
  late final String coverImage;
  
  Category.fromJson(Map<String, dynamic> json){
    category = json['category'];
    coverImage = json['cover_image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['category'] = category;
    _data['cover_image'] = coverImage;
    return _data;
  }
}

class PularSearch {
  PularSearch({
    required this.name,
    required this.image,
  });
  late final String name;
  late final String image;
  
  PularSearch.fromJson(Map<String, dynamic> json){
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['image'] = image;
    return _data;
  }
}