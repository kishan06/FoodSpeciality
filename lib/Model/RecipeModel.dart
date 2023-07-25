class RecipeModel {
  bool? success;
  List<Data>? data;

  RecipeModel({this.success, this.data});

  RecipeModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? video;
  String? coverImage;
  String? name;
  String? description;
  String? difficulty;
  String? cookingTime;
  String? servings;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? userId;
  String? publishedStatus;
  List<Ingredients>? ingredients;
  User? user;
  List<Tags>? tags;

  Data(
      {this.id,
      this.video,
      this.coverImage,
      this.name,
      this.description,
      this.difficulty,
      this.cookingTime,
      this.servings,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.userId,
      this.publishedStatus,
      this.ingredients,
      this.user,
      this.tags});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    video = json['video'];
    coverImage = json['cover_image'];
    name = json['name'];
    description = json['description'];
    difficulty = json['difficulty'];
    cookingTime = json['cooking_time'];
    servings = json['servings'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    userId = json['userId'];
    publishedStatus = json['published_status'];
    if (json['ingredients'] != null) {
      ingredients = <Ingredients>[];
      json['ingredients'].forEach((v) {
        ingredients!.add(new Ingredients.fromJson(v));
      });
    }
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(new Tags.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['video'] = this.video;
    data['cover_image'] = this.coverImage;
    data['name'] = this.name;
    data['description'] = this.description;
    data['difficulty'] = this.difficulty;
    data['cooking_time'] = this.cookingTime;
    data['servings'] = this.servings;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['userId'] = this.userId;
    data['published_status'] = this.publishedStatus;
    if (this.ingredients != null) {
      data['ingredients'] = this.ingredients!.map((v) => v.toJson()).toList();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.tags != null) {
      data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Ingredients {
  String? id;
  String? name;
  String? quantity;
  String? recipeId;

  Ingredients({this.id, this.name, this.quantity, this.recipeId});

  Ingredients.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    quantity = json['quantity'];
    recipeId = json['recipeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['recipeId'] = this.recipeId;
    return data;
  }
}

class User {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? profileImage;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? password;
  String? bio;
  String? location;
  String? socialLinks;
  String? lastLogin;
  bool? online;
  String? role;

  User(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.profileImage,
      this.username,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.password,
      this.bio,
      this.location,
      this.socialLinks,
      this.lastLogin,
      this.online,
      this.role});

  User.fromJson(Map<String, dynamic> json) {
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
    lastLogin = json['last_login'];
    online = json['online'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['profile_image'] = this.profileImage;
    data['username'] = this.username;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['bio'] = this.bio;
    data['location'] = this.location;
    data['social_links'] = this.socialLinks;
    data['last_login'] = this.lastLogin;
    data['online'] = this.online;
    data['role'] = this.role;
    return data;
  }
}

class Tags {
  String? id;
  String? recipeId;
  String? tagId;
  Tag? tag;

  Tags({this.id, this.recipeId, this.tagId, this.tag});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    recipeId = json['recipeId'];
    tagId = json['tagId'];
    tag = json['tag'] != null ? new Tag.fromJson(json['tag']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['recipeId'] = this.recipeId;
    data['tagId'] = this.tagId;
    if (this.tag != null) {
      data['tag'] = this.tag!.toJson();
    }
    return data;
  }
}

class Tag {
  String? id;
  String? name;
  String? tagCategoryId;

  Tag({this.id, this.name, this.tagCategoryId});

  Tag.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    tagCategoryId = json['tag_categoryId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['tag_categoryId'] = this.tagCategoryId;
    return data;
  }
}
