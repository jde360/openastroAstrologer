class AstrologerProfile {
  String? sId;
  String? realName;
  String? email;
  int? phoneNumber;
  String? profileImage;
  String? profileImageFileId;
  String? type;
  String? status;
  bool? isDeleted;
  String? availablityStatus;
  AstroProfile? astroProfile;
  String? displayName;
  String? name;
  String? featuredFileId;
  String? featuredImage;
  String? featuredVideo;
  String? featuredVideoFileId;
  String? featuredVideoThumbnail;
  String? featuredVideoThumbnailFileId;
  String? socketId;

  AstrologerProfile({
    this.sId,
    this.realName,
    this.email,
    this.phoneNumber,
    this.profileImage,
    this.profileImageFileId,
    this.type,
    this.status,
    this.isDeleted,
    this.availablityStatus,
    this.astroProfile,
    this.displayName,
    this.name,
    this.featuredFileId,
    this.featuredImage,
    this.featuredVideo,
    this.featuredVideoFileId,
    this.featuredVideoThumbnail,
    this.featuredVideoThumbnailFileId,
    this.socketId,
  });

  AstrologerProfile.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    realName = json['realName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    profileImage = json['profileImage'];
    profileImageFileId = json['profileImageFileId'];
    type = json['type'];
    status = json['status'];
    isDeleted = json['isDeleted'];

    availablityStatus = json['availablityStatus'];
    astroProfile =
        json['astroProfile'] != null
            ? AstroProfile.fromJson(json['astroProfile'])
            : null;
    displayName = json['displayName'];
    name = json['name'];
    featuredFileId = json['featuredFileId'];
    featuredImage = json['featuredImage'];
    featuredVideo = json['featuredVideo'];
    featuredVideoFileId = json['featuredVideoFileId'];
    featuredVideoThumbnail = json['featuredVideoThumbnail'];
    featuredVideoThumbnailFileId = json['featuredVideoThumbnailFileId'];
    socketId = json['socketId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['realName'] = realName;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['profileImage'] = profileImage;
    data['profileImageFileId'] = profileImageFileId;
    data['type'] = type;
    data['status'] = status;
    data['isDeleted'] = isDeleted;

    data['availablityStatus'] = availablityStatus;
    if (astroProfile != null) {
      data['astroProfile'] = astroProfile!.toJson();
    }

    data['displayName'] = displayName;
    data['name'] = name;
    data['featuredFileId'] = featuredFileId;
    data['featuredImage'] = featuredImage;
    data['featuredVideo'] = featuredVideo;
    data['featuredVideoFileId'] = featuredVideoFileId;
    data['featuredVideoThumbnail'] = featuredVideoThumbnail;
    data['featuredVideoThumbnailFileId'] = featuredVideoThumbnailFileId;
    data['socketId'] = socketId;
    return data;
  }
}

class AstroProfile {
  String? sId;
  String? astrologerId;
  int? experience;
  int? averageRating;
  int? iV;
  bool? callActive;
  bool? chatActive;
  String? desc;
  bool? isVerified;
  List<Puja>? puja;
  List<Specializations>? specializations;
  bool? videoCallActive;

  AstroProfile({
    this.sId,
    this.astrologerId,
    this.experience,
    this.averageRating,
    this.iV,
    this.callActive,
    this.chatActive,
    this.desc,
    this.isVerified,
    this.puja,
    this.specializations,
    this.videoCallActive,
  });

  AstroProfile.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    astrologerId = json['astrologerId'];
    experience = json['experience'];
    averageRating = json['averageRating'];
    iV = json['__v'];
    callActive = json['callActive'];
    chatActive = json['chatActive'];
    desc = json['desc'];
    isVerified = json['isVerified'];
    if (json['puja'] != null) {
      puja = <Puja>[];
      json['puja'].forEach((v) {
        puja!.add(Puja.fromJson(v));
      });
    }
    if (json['specializations'] != null) {
      specializations = <Specializations>[];
      json['specializations'].forEach((v) {
        specializations!.add(Specializations.fromJson(v));
      });
    }
    videoCallActive = json['videoCallActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['astrologerId'] = astrologerId;
    data['experience'] = experience;
    data['averageRating'] = averageRating;
    data['__v'] = iV;
    data['callActive'] = callActive;
    data['chatActive'] = chatActive;
    data['desc'] = desc;
    data['isVerified'] = isVerified;
    if (puja != null) {
      data['puja'] = puja!.map((v) => v.toJson()).toList();
    }
    if (specializations != null) {
      data['specializations'] =
          specializations!.map((v) => v.toJson()).toList();
    }
    data['videoCallActive'] = videoCallActive;
    return data;
  }
}

class Puja {
  String? sId;
  String? name;

  Puja({this.sId, this.name});

  Puja.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    return data;
  }
}

class Specializations {
  String? sId;
  String? name;

  Specializations({this.sId, this.name});

  Specializations.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    return data;
  }
}
