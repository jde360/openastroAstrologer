class FollowersList {
  String? sId;
  User? user;
  String? astrologerId;
  int? iV;

  FollowersList({this.sId, this.user, this.astrologerId, this.iV});

  FollowersList.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['userId'] != null ? new User.fromJson(json['userId']) : null;
    astrologerId = json['astrologerId'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.user != null) {
      data['userId'] = this.user!.toJson();
    }
    data['astrologerId'] = this.astrologerId;
    data['__v'] = this.iV;
    return data;
  }
}

class User {
  String? sId;
  String? name;

  User({this.sId, this.name});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    return data;
  }
}
