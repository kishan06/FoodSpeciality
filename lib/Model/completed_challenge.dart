class CompletedChallengeModel {
  CompletedChallengeModel({
    required this.success,
    required this.message,
    required this.data,
  });
  late final bool success;
  late final String message;
  late final List<Data> data;
  
  CompletedChallengeModel.fromJson(Map<String, dynamic> json){
    success = json['success'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['message'] = message;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
     this.thumbnail,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.challengeRecipe,
  });
  late final String id;
  late final Null thumbnail;
  late final String title;
  late final String description;
  late final String startDate;
  late final String endDate;
  late final String status;
  late final List<ChallengeRecipe> challengeRecipe;
  
  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    thumbnail = null;
    title = json['title'];
    description = json['description'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    status = json['status'];
    challengeRecipe = List.from(json['challenge_recipe']).map((e)=>ChallengeRecipe.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['thumbnail'] = thumbnail;
    _data['title'] = title;
    _data['description'] = description;
    _data['start_date'] = startDate;
    _data['end_date'] = endDate;
    _data['status'] = status;
    _data['challenge_recipe'] = challengeRecipe.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class ChallengeRecipe {
  ChallengeRecipe({
    required this.id,
    required this.challengeId,
    required this.recipeId,
    required this.userId,
    required this.receipe,
  });
  late final String id;
  late final String challengeId;
  late final String recipeId;
  late final String userId;
  late final Receipe receipe;
  
  ChallengeRecipe.fromJson(Map<String, dynamic> json){
    id = json['id'];
    challengeId = json['challengeId'];
    recipeId = json['recipeId'];
    userId = json['userId'];
    receipe = Receipe.fromJson(json['receipe']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['challengeId'] = challengeId;
    _data['recipeId'] = recipeId;
    _data['userId'] = userId;
    _data['receipe'] = receipe.toJson();
    return _data;
  }
}

class Receipe {
  Receipe({
    required this.id,
    required this.video,
    required this.coverImage,
    required this.name,
    required this.description,
    required this.difficulty,
    required this.cookingTime,
    required this.servings,
     this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    required this.publishedStatus,
  });
  late final String id;
  late final String video;
  late final String coverImage;
  late final String name;
  late final String description;
  late final String difficulty;
  late final String cookingTime;
  late final String servings;
  late final Null status;
  late final String createdAt;
  late final String updatedAt;
  late final String userId;
  late final String publishedStatus;
  
  Receipe.fromJson(Map<String, dynamic> json){
    id = json['id'];
    video = json['video'];
    coverImage = json['cover_image'];
    name = json['name'];
    description = json['description'];
    difficulty = json['difficulty'];
    cookingTime = json['cooking_time'];
    servings = json['servings'];
    status = null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    userId = json['userId'];
    publishedStatus = json['published_status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['video'] = video;
    _data['cover_image'] = coverImage;
    _data['name'] = name;
    _data['description'] = description;
    _data['difficulty'] = difficulty;
    _data['cooking_time'] = cookingTime;
    _data['servings'] = servings;
    _data['status'] = status;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['userId'] = userId;
    _data['published_status'] = publishedStatus;
    return _data;
  }
}