class NotificationModel {
  NotificationModel({
    required this.success,
    required this.data,
  });
  late final bool success;
  late final Data data;
  
  NotificationModel.fromJson(Map<String, dynamic> json){
    success = json['success'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.userNotification,
  });
  late final List<UserNotification> userNotification;
  
  Data.fromJson(Map<String, dynamic> json){
    userNotification = List.from(json['user_notification']).map((e)=>UserNotification.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user_notification'] = userNotification.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class UserNotification {
  UserNotification({
    required this.id,
    required this.message,
    required this.userId,
    required this.associateId,
     this.communityId,
     this.postId,
    required this.createdAt,
    required this.seen,
    required this.lastSeen,
    required this.type,
    required this.associatedUser,
     this.associatedPost,
     this.associatedCommunity,
    required this.isFollowedByReqIdUser,
  });
  late final String id;
  late final String message;
  late final String userId;
  late final String associateId;
  late final String? communityId;
  late final String? postId;
  late final String createdAt;
  late final bool seen;
  late final String lastSeen;
  late final String type;
  late final AssociatedUser associatedUser;
  late final AssociatedPost? associatedPost;
  late final AssociatedCommunity? associatedCommunity;
  late final bool isFollowedByReqIdUser;
  
  UserNotification.fromJson(Map<String, dynamic> json){
    id = json['id'];
    message = json['message'];
    userId = json['userId'];
    associateId = json['associateId'];
    communityId = null;
    postId = json['postId'];
    createdAt = json['createdAt'];
    seen = json['seen'];
    lastSeen = json['lastSeen'];
    type = json['type'];
    associatedUser = AssociatedUser.fromJson(json['associatedUser']);
    associatedPost = null;
    associatedCommunity = null;
    isFollowedByReqIdUser = json['isFollowedByReqIdUser'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['message'] = message;
    _data['userId'] = userId;
    _data['associateId'] = associateId;
    _data['communityId'] = communityId;
    _data['postId'] = postId;
    _data['createdAt'] = createdAt;
    _data['seen'] = seen;
    _data['lastSeen'] = lastSeen;
    _data['type'] = type;
    _data['associatedUser'] = associatedUser.toJson();
    _data['associatedPost'] = associatedPost;
    _data['associatedCommunity'] = associatedCommunity;
    _data['isFollowedByReqIdUser'] = isFollowedByReqIdUser;
    return _data;
  }
}

class AssociatedUser {
  AssociatedUser({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
     this.profileImage,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.password,
     this.bio,
     this.location,
     this.socialLinks,
     this.twitterLink,
     this.instagramLink,
     this.pinterestLink,
     this.facebookLink,
     this.authID,
    required this.playerId,
     this.lastLogin,
    required this.online,
    required this.role,
    required this.followers,
    required this.following,
    required this.savedRecipes,
    required this.community,
  });
  late final String id;
  late final String createdAt;
  late final String updatedAt;
  late final Null profileImage;
  late final String username;
  late final String firstName;
  late final String lastName;
  late final String email;
  late final String phone;
  late final String password;
  late final Null bio;
  late final Null location;
  late final Null socialLinks;
  late final Null twitterLink;
  late final Null instagramLink;
  late final Null pinterestLink;
  late final Null facebookLink;
  late final Null authID;
  late final String playerId;
  late final Null lastLogin;
  late final bool online;
  late final String role;
  late final List<Followers> followers;
  late final List<Following> following;
  late final List<dynamic> savedRecipes;
  late final List<dynamic> community;
  
  AssociatedUser.fromJson(Map<String, dynamic> json){
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    profileImage = null;
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    bio = null;
    location = null;
    socialLinks = null;
    twitterLink = null;
    instagramLink = null;
    pinterestLink = null;
    facebookLink = null;
    authID = null;
    playerId = json['playerId'];
    lastLogin = null;
    online = json['online'];
    role = json['role'];
    followers = List.from(json['followers']).map((e)=>Followers.fromJson(e)).toList();
    following = List.from(json['following']).map((e)=>Following.fromJson(e)).toList();
    savedRecipes = List.castFrom<dynamic, dynamic>(json['saved_recipes']);
    community = List.castFrom<dynamic, dynamic>(json['community']);
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
    _data['authID'] = authID;
    _data['playerId'] = playerId;
    _data['last_login'] = lastLogin;
    _data['online'] = online;
    _data['role'] = role;
    _data['followers'] = followers.map((e)=>e.toJson()).toList();
    _data['following'] = following.map((e)=>e.toJson()).toList();
    _data['saved_recipes'] = savedRecipes;
    _data['community'] = community;
    return _data;
  }
}

class Followers {
  Followers({
    required this.followerId,
    required this.followingId,
  });
  late final String followerId;
  late final String followingId;
  
  Followers.fromJson(Map<String, dynamic> json){
    followerId = json['followerId'];
    followingId = json['followingId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['followerId'] = followerId;
    _data['followingId'] = followingId;
    return _data;
  }
}

class Following {
  Following({
    required this.followerId,
    required this.followingId,
  });
  late final String followerId;
  late final String followingId;
  
  Following.fromJson(Map<String, dynamic> json){
    followerId = json['followerId'];
    followingId = json['followingId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['followerId'] = followerId;
    _data['followingId'] = followingId;
    return _data;
  }
}

class AssociatedPost {
  AssociatedPost({
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
  
  AssociatedPost.fromJson(Map<String, dynamic> json){
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

class AssociatedCommunity {
  AssociatedCommunity({
    required this.id,
    required this.name,
    required this.description,
     this.profileImage,
    required this.adminId,
  });
  late final String id;
  late final String name;
  late final String description;
  late final Null profileImage;
  late final String adminId;
  
  AssociatedCommunity.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    description = json['description'];
    profileImage = null;
    adminId = json['adminId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['description'] = description;
    _data['profile_image'] = profileImage;
    _data['adminId'] = adminId;
    return _data;
  }
}