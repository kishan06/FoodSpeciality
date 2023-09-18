class SearchRecipeModel {
  SearchRecipeModel({
    required this.success,
    required this.data,
  });
  late final bool success;
  late final List<Data> data;
  
  SearchRecipeModel.fromJson(Map<String, dynamic> json){
    success = json['success'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
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
    required this.tags,
    required this.user,
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
  late final List<Tags> tags;
  late final User user;
  
  Data.fromJson(Map<String, dynamic> json){
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
    tags = List.from(json['tags']).map((e)=>Tags.fromJson(e)).toList();
    user = User.fromJson(json['user']);
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
    _data['tags'] = tags.map((e)=>e.toJson()).toList();
    _data['user'] = user.toJson();
    return _data;
  }
}

class Tags {
  Tags({
    required this.tag,
  });
  late final Tag tag;
  
  Tags.fromJson(Map<String, dynamic> json){
    tag = Tag.fromJson(json['tag']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['tag'] = tag.toJson();
    return _data;
  }
}

class Tag {
  Tag({
    required this.id,
    required this.name,
     this.tagCategoryId,
  });
  late final String id;
  late final String name;
  late final Null tagCategoryId;
  
  Tag.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    tagCategoryId = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['tag_categoryId'] = tagCategoryId;
    return _data;
  }
}

class User {
  User({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.profileImage,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.password,
    required this.bio,
    required this.location,
    required this.socialLinks,
    required this.twitterLink,
    required this.instagramLink,
    required this.pinterestLink,
    required this.facebookLink,
     this.lastLogin,
    required this.online,
    required this.role,
  });
  late final String id;
  late final String createdAt;
  late final String updatedAt;
  late final String profileImage;
  late final String username;
  late final String firstName;
  late final String lastName;
  late final String email;
  late final String phone;
  late final String password;
  late final String bio;
  late final String location;
  late final String socialLinks;
  late final String twitterLink;
  late final String instagramLink;
  late final String pinterestLink;
  late final String facebookLink;
  late final Null lastLogin;
  late final bool online;
  late final String role;
  
  User.fromJson(Map<String, dynamic> json){
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    profileImage = json['profile_image'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    bio = json['bio'];
    location = json['location'];
    socialLinks = json['social_links'];
    twitterLink = json['twitter_link'];
    instagramLink = json['instagram_link'];
    pinterestLink = json['pinterest_link'];
    facebookLink = json['facebook_link'];
    lastLogin = null;
    online = json['online'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['profile_image'] = profileImage;
    _data['username'] = username;
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['email'] = email;
    _data['phone'] = phone;
    _data['password'] = password;
    _data['bio'] = bio;
    _data['location'] = location;
    _data['social_links'] = socialLinks;
    _data['twitter_link'] = twitterLink;
    _data['instagram_link'] = instagramLink;
    _data['pinterest_link'] = pinterestLink;
    _data['facebook_link'] = facebookLink;
    _data['last_login'] = lastLogin;
    _data['online'] = online;
    _data['role'] = role;
    return _data;
  }
}