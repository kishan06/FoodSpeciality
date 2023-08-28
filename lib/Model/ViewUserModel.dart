class ViewUserModel {
  bool? success;
  Data? data;

  ViewUserModel({this.success, this.data});

  ViewUserModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
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
  List<Recipes>? recipes;
  List<Followers>? followers;
  List<Following>? following;
  int? followersLength;
  int? followingLength;

  Data(
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
      this.recipes,
      this.followers,
      this.following,
      this.followersLength,
      this.followingLength});

  Data.fromJson(Map<String, dynamic> json) {
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
    if (json['recipes'] != null) {
      recipes = <Recipes>[];
      json['recipes'].forEach((v) {
        recipes!.add(new Recipes.fromJson(v));
      });
    }
    if (json['followers'] != null) {
      followers = <Followers>[];
      json['followers'].forEach((v) {
        followers!.add(new Followers.fromJson(v));
      });
    }
    if (json['following'] != null) {
      following = <Following>[];
      json['following'].forEach((v) {
        following!.add(new Following.fromJson(v));
      });
    }
    followersLength = json['followers_length'];
    followingLength = json['following_length'];
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
    data['twitter_link'] = this.twitterLink;
    data['instagram_link'] = this.instagramLink;
    data['pinterest_link'] = this.pinterestLink;
    data['facebook_link'] = this.facebookLink;
    data['last_login'] = this.lastLogin;
    data['online'] = this.online;
    data['role'] = this.role;
    if (this.recipes != null) {
      data['recipes'] = this.recipes!.map((v) => v.toJson()).toList();
    }
    if (this.followers != null) {
      data['followers'] = this.followers!.map((v) => v.toJson()).toList();
    }
    if (this.following != null) {
      data['following'] = this.following!.map((v) => v.toJson()).toList();
    }
    data['followers_length'] = this.followersLength;
    data['following_length'] = this.followingLength;
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
      this.publishedStatus});

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
    follower = json['follower'] != null
        ? new Follower.fromJson(json['follower'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['followerId'] = this.followerId;
    data['followingId'] = this.followingId;
    if (this.follower != null) {
      data['follower'] = this.follower!.toJson();
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
    data['twitter_link'] = this.twitterLink;
    data['instagram_link'] = this.instagramLink;
    data['pinterest_link'] = this.pinterestLink;
    data['facebook_link'] = this.facebookLink;
    data['last_login'] = this.lastLogin;
    data['online'] = this.online;
    data['role'] = this.role;
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
    following = json['following'] != null
        ? new Follower.fromJson(json['following'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['followerId'] = this.followerId;
    data['followingId'] = this.followingId;
    if (this.following != null) {
      data['following'] = this.following!.toJson();
    }
    return data;
  }
}
