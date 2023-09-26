class ViewUserModel {
  bool? success;
  User? user;
  List<Recipes>? recipes;
  List<Userfollowing>? userfollowing;
  List<Userfollower>? userfollower;

  ViewUserModel(
      {this.success,
      this.user,
      this.recipes,
      this.userfollowing,
      this.userfollower});

  ViewUserModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['recipes'] != null) {
      recipes = <Recipes>[];
      json['recipes'].forEach((v) {
        recipes!.add(Recipes.fromJson(v));
      });
    }
    if (json['userfollowing'] != null) {
      userfollowing = <Userfollowing>[];
      json['userfollowing'].forEach((v) {
        userfollowing!.add(Userfollowing.fromJson(v));
      });
    }
    if (json['userfollower'] != null) {
      userfollower = <Userfollower>[];
      json['userfollower'].forEach((v) {
        userfollower!.add(Userfollower.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (recipes != null) {
      data['recipes'] = recipes!.map((v) => v.toJson()).toList();
    }
    if (userfollowing != null) {
      data['userfollowing'] = userfollowing!.map((v) => v.toJson()).toList();
    }
    if (userfollower != null) {
      data['userfollower'] = userfollower!.map((v) => v.toJson()).toList();
    }
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
  String? twitterLink;
  String? instagramLink;
  String? pinterestLink;
  String? facebookLink;
  String? lastLogin;
  bool? online;
  String? role;
  List<Followers>? followers;
  List<Following>? following;
  List<SavedRecipes>? savedRecipes;
  int? followersLength;
  int? followingLength;

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
      this.twitterLink,
      this.instagramLink,
      this.pinterestLink,
      this.facebookLink,
      this.lastLogin,
      this.online,
      this.role,
      this.followers,
      this.following,
      this.savedRecipes,
      this.followersLength,
      this.followingLength});

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
    twitterLink = json['twitter_link'];
    instagramLink = json['instagram_link'];
    pinterestLink = json['pinterest_link'];
    facebookLink = json['facebook_link'];
    lastLogin = json['last_login'];
    online = json['online'];
    role = json['role'];
    if (json['followers'] != null) {
      followers = <Followers>[];
      json['followers'].forEach((v) {
        followers!.add(Followers.fromJson(v));
      });
    }
    if (json['following'] != null) {
      following = <Following>[];
      json['following'].forEach((v) {
        following!.add(Following.fromJson(v));
      });
    }
    if (json['saved_recipes'] != null) {
      savedRecipes = <SavedRecipes>[];
      json['saved_recipes'].forEach((v) {
        savedRecipes!.add(SavedRecipes.fromJson(v));
      });
    }
    followersLength = json['followers_length'];
    followingLength = json['following_length'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['profile_image'] = profileImage;
    data['username'] = username;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['phone'] = phone;
    data['password'] = password;
    data['bio'] = bio;
    data['location'] = location;
    data['social_links'] = socialLinks;
    data['twitter_link'] = twitterLink;
    data['instagram_link'] = instagramLink;
    data['pinterest_link'] = pinterestLink;
    data['facebook_link'] = facebookLink;
    data['last_login'] = lastLogin;
    data['online'] = online;
    data['role'] = role;
    if (followers != null) {
      data['followers'] = followers!.map((v) => v.toJson()).toList();
    }
    if (following != null) {
      data['following'] = following!.map((v) => v.toJson()).toList();
    }
    if (savedRecipes != null) {
      data['saved_recipes'] = savedRecipes!.map((v) => v.toJson()).toList();
    }
    data['followers_length'] = followersLength;
    data['following_length'] = followingLength;
    return data;
  }
}

class Followers {
  String? followerId;
  String? followingId;
  Follower? follower;

  Followers({this.followerId, this.followingId, this.follower});

  Followers.fromJson(Map<String, dynamic> json) {
    followerId = json['followerId'];
    followingId = json['followingId'];
    follower =
        json['follower'] != null ? Follower.fromJson(json['follower']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['followerId'] = followerId;
    data['followingId'] = followingId;
    if (follower != null) {
      data['follower'] = follower!.toJson();
    }
    return data;
  }
}

class Follower {
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
  String? twitterLink;
  String? instagramLink;
  String? pinterestLink;
  String? facebookLink;
  String? lastLogin;
  bool? online;
  String? role;

  Follower(
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
      this.twitterLink,
      this.instagramLink,
      this.pinterestLink,
      this.facebookLink,
      this.lastLogin,
      this.online,
      this.role});

  Follower.fromJson(Map<String, dynamic> json) {
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
    lastLogin = json['last_login'];
    online = json['online'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['profile_image'] = profileImage;
    data['username'] = username;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['phone'] = phone;
    data['password'] = password;
    data['bio'] = bio;
    data['location'] = location;
    data['social_links'] = socialLinks;
    data['twitter_link'] = twitterLink;
    data['instagram_link'] = instagramLink;
    data['pinterest_link'] = pinterestLink;
    data['facebook_link'] = facebookLink;
    data['last_login'] = lastLogin;
    data['online'] = online;
    data['role'] = role;
    return data;
  }
}

class Following {
  String? followerId;
  String? followingId;
  Follower? following;

  Following({this.followerId, this.followingId, this.following});

  Following.fromJson(Map<String, dynamic> json) {
    followerId = json['followerId'];
    followingId = json['followingId'];
    following =
        json['following'] != null ? Follower.fromJson(json['following']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['followerId'] = followerId;
    data['followingId'] = followingId;
    if (following != null) {
      data['following'] = following!.toJson();
    }
    return data;
  }
}

class SavedRecipes {
  String? userId;
  String? recipeId;

  SavedRecipes({this.userId, this.recipeId});

  SavedRecipes.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    recipeId = json['recipeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['recipeId'] = recipeId;
    return data;
  }
}

class Recipes {
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
  User1? user;
  List<Tags>? tags;
  List<LikedRecipe>? likedRecipe;
  List<SavedRecipe>? savedRecipe;
  int? comments;
  int? likes;
  bool? liked;
  bool? saved;
  int? savedLength;
  bool? following;

  Recipes(
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
      this.tags,
      this.likedRecipe,
      this.savedRecipe,
      this.comments,
      this.likes,
      this.liked,
      this.saved,
      this.savedLength,
      this.following});

  Recipes.fromJson(Map<String, dynamic> json) {
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
        ingredients!.add(Ingredients.fromJson(v));
      });
    }
    user = json['user'] != null ? User1.fromJson(json['user']) : null;
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(Tags.fromJson(v));
      });
    }
    if (json['liked_recipe'] != null) {
      likedRecipe = <LikedRecipe>[];
      json['liked_recipe'].forEach((v) {
        likedRecipe!.add(LikedRecipe.fromJson(v));
      });
    }
    if (json['saved_recipe'] != null) {
      savedRecipe = <SavedRecipe>[];
      json['saved_recipe'].forEach((v) {
        savedRecipe!.add(SavedRecipe.fromJson(v));
      });
    }
    comments = json['comments'];
    likes = json['likes'];
    liked = json['liked'];
    saved = json['saved'];
    savedLength = json['saved_length'];
    following = json['following'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['video'] = video;
    data['cover_image'] = coverImage;
    data['name'] = name;
    data['description'] = description;
    data['difficulty'] = difficulty;
    data['cooking_time'] = cookingTime;
    data['servings'] = servings;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['userId'] = userId;
    data['published_status'] = publishedStatus;
    if (ingredients != null) {
      data['ingredients'] = ingredients!.map((v) => v.toJson()).toList();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (tags != null) {
      data['tags'] = tags!.map((v) => v.toJson()).toList();
    }
    if (likedRecipe != null) {
      data['liked_recipe'] = likedRecipe!.map((v) => v.toJson()).toList();
    }
    if (savedRecipe != null) {
      data['saved_recipe'] = savedRecipe!.map((v) => v.toJson()).toList();
    }
    data['comments'] = comments;
    data['likes'] = likes;
    data['liked'] = liked;
    data['saved'] = saved;
    data['saved_length'] = savedLength;
    data['following'] = following;
    return data;
  }
}

class LikedRecipe {
  String? userId;
  String? recipeId;

  LikedRecipe({this.userId, this.recipeId});

  LikedRecipe.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    recipeId = json['recipeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['recipeId'] = recipeId;
    return data;
  }
}

class SavedRecipe {
  String? userId;
  String? recipeId;

  SavedRecipe({this.userId, this.recipeId});

  SavedRecipe.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    recipeId = json['recipeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['recipeId'] = recipeId;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['quantity'] = quantity;
    data['recipeId'] = recipeId;
    return data;
  }
}

class User1 {
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
  String? twitterLink;
  String? instagramLink;
  String? pinterestLink;
  String? facebookLink;
  String? lastLogin;
  bool? online;
  String? role;
  List<Followers>? followers;

  User1(
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
      this.twitterLink,
      this.instagramLink,
      this.pinterestLink,
      this.facebookLink,
      this.lastLogin,
      this.online,
      this.role,
      this.followers});

  User1.fromJson(Map<String, dynamic> json) {
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
    lastLogin = json['last_login'];
    online = json['online'];
    role = json['role'];
    if (json['followers'] != null) {
      followers = <Followers>[];
      json['followers'].forEach((v) {
        followers!.add(Followers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['profile_image'] = profileImage;
    data['username'] = username;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['phone'] = phone;
    data['password'] = password;
    data['bio'] = bio;
    data['location'] = location;
    data['social_links'] = socialLinks;
    data['twitter_link'] = twitterLink;
    data['instagram_link'] = instagramLink;
    data['pinterest_link'] = pinterestLink;
    data['facebook_link'] = facebookLink;
    data['last_login'] = lastLogin;
    data['online'] = online;
    data['role'] = role;
    if (followers != null) {
      data['followers'] = followers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Follower1 {
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
  String? twitterLink;
  String? instagramLink;
  String? pinterestLink;
  String? facebookLink;
  String? lastLogin;
  bool? online;
  String? role;

  Follower1(
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
      this.twitterLink,
      this.instagramLink,
      this.pinterestLink,
      this.facebookLink,
      this.lastLogin,
      this.online,
      this.role});

  Follower1.fromJson(Map<String, dynamic> json) {
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
    lastLogin = json['last_login'];
    online = json['online'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['profile_image'] = profileImage;
    data['username'] = username;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['phone'] = phone;
    data['password'] = password;
    data['bio'] = bio;
    data['location'] = location;
    data['social_links'] = socialLinks;
    data['twitter_link'] = twitterLink;
    data['instagram_link'] = instagramLink;
    data['pinterest_link'] = pinterestLink;
    data['facebook_link'] = facebookLink;
    data['last_login'] = lastLogin;
    data['online'] = online;
    data['role'] = role;
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
    tag = json['tag'] != null ? Tag.fromJson(json['tag']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['recipeId'] = recipeId;
    data['tagId'] = tagId;
    if (tag != null) {
      data['tag'] = tag!.toJson();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['tag_categoryId'] = tagCategoryId;
    return data;
  }
}

class Userfollowing {
  String? followerId;
  String? followingId;
  Follower? following;
  bool? isfollow;

  Userfollowing(
      {this.followerId, this.followingId, this.following, this.isfollow});

  Userfollowing.fromJson(Map<String, dynamic> json) {
    followerId = json['followerId'];
    followingId = json['followingId'];
    following =
        json['following'] != null ? Follower.fromJson(json['following']) : null;
    isfollow = json['isfollow'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['followerId'] = followerId;
    data['followingId'] = followingId;
    if (following != null) {
      data['following'] = following!.toJson();
    }
    data['isfollow'] = isfollow;
    return data;
  }
}

class Userfollower {
  String? followerId;
  String? followingId;
  Follower? follower;
  bool? isfollow;

  Userfollower(
      {this.followerId, this.followingId, this.follower, this.isfollow});

  Userfollower.fromJson(Map<String, dynamic> json) {
    followerId = json['followerId'];
    followingId = json['followingId'];
    follower =
        json['follower'] != null ? Follower.fromJson(json['follower']) : null;
    isfollow = json['isfollow'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['followerId'] = followerId;
    data['followingId'] = followingId;
    if (follower != null) {
      data['follower'] = follower!.toJson();
    }
    data['isfollow'] = isfollow;
    return data;
  }
}
