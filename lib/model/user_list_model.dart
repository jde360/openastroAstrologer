class UserListModel {
  String? sId;
  String? name;
  String? realName;
  String? email;
  String? profileImage;
  String? profileImageFileId;
  String? type;
  String? status;
  bool? isDeleted;
  String? userDetails;
  String? availablityStatus;
  String? featuredFileId;
  String? featuredImage;
  String? featuredVideo;
  String? featuredVideoFileId;
  String? featuredVideoThumbnail;
  String? featuredVideoThumbnailFileId;

  UserListModel({
    this.sId,
    this.name,
    this.realName,
    this.email,
    this.profileImage,
    this.profileImageFileId,
    this.type,
    this.status,
    this.isDeleted,
    this.userDetails,
    this.availablityStatus,
    this.featuredFileId,
    this.featuredImage,
    this.featuredVideo,
    this.featuredVideoFileId,
    this.featuredVideoThumbnail,
    this.featuredVideoThumbnailFileId,
  });

  UserListModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    realName = json['realName'];
    email = json['email'];
    profileImage = json['profileImage'];
    profileImageFileId = json['profileImageFileId'];
    type = json['type'];
    status = json['status'];
    isDeleted = json['isDeleted'];
    userDetails = json['userDetails'];
    availablityStatus = json['availablityStatus'];
    featuredFileId = json['featuredFileId'];
    featuredImage = json['featuredImage'];
    featuredVideo = json['featuredVideo'];
    featuredVideoFileId = json['featuredVideoFileId'];
    featuredVideoThumbnail = json['featuredVideoThumbnail'];
    featuredVideoThumbnailFileId = json['featuredVideoThumbnailFileId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['realName'] = this.realName;
    data['email'] = this.email;
    data['profileImage'] = this.profileImage;
    data['profileImageFileId'] = this.profileImageFileId;
    data['type'] = this.type;
    data['status'] = this.status;
    data['isDeleted'] = this.isDeleted;
    data['availablityStatus'] = this.availablityStatus;
    data['featuredFileId'] = this.featuredFileId;
    data['featuredImage'] = this.featuredImage;
    data['featuredVideo'] = this.featuredVideo;
    data['featuredVideoFileId'] = this.featuredVideoFileId;
    data['featuredVideoThumbnail'] = this.featuredVideoThumbnail;
    data['featuredVideoThumbnailFileId'] = this.featuredVideoThumbnailFileId;
    return data;
  }
}
