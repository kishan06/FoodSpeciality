class UserData {
  UserData({
    required this.success,
    required this.data,
  });
  late final bool success;
  late final Data data;
  
  UserData.fromJson(Map<String, dynamic> json){
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
    required this.accessToken,
    required this.refreshToken,
    required this.user,
  });
  late final String accessToken;
  late final String refreshToken;
  late final User user;
  
  Data.fromJson(Map<String, dynamic> json){
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    user = User.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['accessToken'] = accessToken;
    _data['refreshToken'] = refreshToken;
    _data['user'] = user.toJson();
    return _data;
  }
}

class User {
  User({
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
    required this.lastLogin,
    required this.online,
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
  late final String lastLogin;
  late final bool online;
  
  User.fromJson(Map<String, dynamic> json){
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
    lastLogin = json['last_login'];
    online = json['online'];
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
    _data['last_login'] = lastLogin;
    _data['online'] = online;
    return _data;
  }
}