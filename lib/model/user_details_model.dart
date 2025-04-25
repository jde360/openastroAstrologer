class UserDetailsModel {
  String? sId;
  String? name;
  String? email;
  String? profileImage;
  UserDetails? userDetails;

  UserDetailsModel({
    this.sId,
    this.name,
    this.email,
    this.profileImage,
    this.userDetails,
  });

  UserDetailsModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    profileImage = json['profileImage'];
    userDetails =
        json['userDetails'] != null
            ? new UserDetails.fromJson(json['userDetails'])
            : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['profileImage'] = this.profileImage;
    if (this.userDetails != null) {
      data['userDetails'] = this.userDetails!.toJson();
    }
    return data;
  }
}

class UserDetails {
  String? sId;

  UserDetails({this.sId});

  UserDetails.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    return data;
  }
}
