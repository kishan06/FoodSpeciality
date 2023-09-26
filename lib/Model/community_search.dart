class CommunitySearch {
  CommunitySearch({
    required this.success,
    required this.data,
  });
  late final bool success;
  late final List<Data> data;
  
  CommunitySearch.fromJson(Map<String, dynamic> json){
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
    required this.name,
    required this.description,
     this.profileImage,
    required this.adminId,
    required this.members,
  });
  late final String id;
  late final String name;
  late final String description;
  late final Null profileImage;
  late final String adminId;
  late final List<Members> members;
  
  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    description = json['description'];
    profileImage = null;
    adminId = json['adminId'];
    members = List.from(json['members']).map((e)=>Members.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['description'] = description;
    _data['profile_image'] = profileImage;
    _data['adminId'] = adminId;
    _data['members'] = members.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Members {
  Members({
    required this.id,
    required this.userId,
    required this.communityId,
  });
  late final String id;
  late final String userId;
  late final String communityId;
  
  Members.fromJson(Map<String, dynamic> json){
    id = json['id'];
    userId = json['userId'];
    communityId = json['communityId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['userId'] = userId;
    _data['communityId'] = communityId;
    return _data;
  }
}