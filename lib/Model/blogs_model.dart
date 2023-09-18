class BlogsModel {
  BlogsModel({
    required this.success,
    required this.message,
    required this.data,
  });
  late final bool success;
  late final String message;
  late final Data data;
  
  BlogsModel.fromJson(Map<String, dynamic> json){
    success = json['success'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.healthy,
    required this.breakfast,
    required this.dessert,
  });
  late final List<Healthy> healthy;
  late final List<Breakfast> breakfast;
  late final List<Dessert> dessert;
  
  Data.fromJson(Map<String, dynamic> json){
    healthy = List.from(json['healthy']).map((e)=>Healthy.fromJson(e)).toList();
    breakfast = List.from(json['breakfast']).map((e)=>Breakfast.fromJson(e)).toList();
    dessert = List.from(json['dessert']).map((e)=>Dessert.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['healthy'] = healthy.map((e)=>e.toJson()).toList();
    _data['breakfast'] = breakfast.map((e)=>e.toJson()).toList();
    _data['dessert'] = dessert.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Healthy {
  Healthy({
    required this.id,
    required this.name,
    required this.title,
    required this.publishDate,
    required this.category,
    required this.description,
    required this.contentImage,
    required this.readTime,
    required this.categoryId,
  });
  late final String id;
  late final String name;
  late final String title;
  late final String publishDate;
  late final String category;
  late final String description;
  late final String contentImage;
  late final int readTime;
  late final String categoryId;
  
  Healthy.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    title = json['title'];
    publishDate = json['publish_date'];
    category = json['category'];
    description = json['description'];
    contentImage = json['content_image'];
    readTime = json['read_time'];
    categoryId = json['categoryId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['title'] = title;
    _data['publish_date'] = publishDate;
    _data['category'] = category;
    _data['description'] = description;
    _data['content_image'] = contentImage;
    _data['read_time'] = readTime;
    _data['categoryId'] = categoryId;
    return _data;
  }
}

class Breakfast {
  Breakfast({
    required this.id,
    required this.name,
    required this.title,
    required this.publishDate,
    required this.category,
    required this.description,
    required this.contentImage,
    required this.readTime,
    required this.categoryId,
  });
  late final String id;
  late final String name;
  late final String title;
  late final String publishDate;
  late final String category;
  late final String description;
  late final String contentImage;
  late final int readTime;
  late final String categoryId;
  
  Breakfast.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    title = json['title'];
    publishDate = json['publish_date'];
    category = json['category'];
    description = json['description'];
    contentImage = json['content_image'];
    readTime = json['read_time'];
    categoryId = json['categoryId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['title'] = title;
    _data['publish_date'] = publishDate;
    _data['category'] = category;
    _data['description'] = description;
    _data['content_image'] = contentImage;
    _data['read_time'] = readTime;
    _data['categoryId'] = categoryId;
    return _data;
  }
}

class Dessert {
  Dessert({
    required this.id,
    required this.name,
    required this.title,
    required this.publishDate,
    required this.category,
    required this.description,
    required this.contentImage,
    required this.readTime,
    required this.categoryId,
  });
  late final String id;
  late final String name;
  late final String title;
  late final String publishDate;
  late final String category;
  late final String description;
  late final String contentImage;
  late final int readTime;
  late final String categoryId;
  
  Dessert.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    title = json['title'];
    publishDate = json['publish_date'];
    category = json['category'];
    description = json['description'];
    contentImage = json['content_image'];
    readTime = json['read_time'];
    categoryId = json['categoryId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['title'] = title;
    _data['publish_date'] = publishDate;
    _data['category'] = category;
    _data['description'] = description;
    _data['content_image'] = contentImage;
    _data['read_time'] = readTime;
    _data['categoryId'] = categoryId;
    return _data;
  }
}