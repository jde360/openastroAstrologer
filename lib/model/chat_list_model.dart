class ChatList {
  String? sId;
  UserId? userId;
  AstrologerId? astrologerId;
  String? lastMessage;
  bool? chatOpen;
  String? createdAt;
  String? updatedAt;
  int? iV;
  int? unreadCount;

  ChatList({
    this.sId,
    this.userId,
    this.astrologerId,
    this.lastMessage,
    this.chatOpen,
    this.createdAt,
    this.updatedAt,
    this.iV,
    this.unreadCount,
  });

  ChatList.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId =
        json['userId'] != null ? new UserId.fromJson(json['userId']) : null;
    astrologerId =
        json['astrologerId'] != null
            ? new AstrologerId.fromJson(json['astrologerId'])
            : null;
    lastMessage = json['lastMessage'];
    chatOpen = json['chatOpen'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    unreadCount = json['unreadCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.userId != null) {
      data['userId'] = this.userId!.toJson();
    }
    if (this.astrologerId != null) {
      data['astrologerId'] = this.astrologerId!.toJson();
    }
    data['lastMessage'] = this.lastMessage;
    data['chatOpen'] = this.chatOpen;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['unreadCount'] = this.unreadCount;
    return data;
  }
}

class UserId {
  String? sId;
  String? name;
  String? profileImage;
  String? socketId;

  UserId({this.sId, this.name, this.profileImage, this.socketId});

  UserId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    profileImage = json['profileImage'];
    socketId = json['socketId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['profileImage'] = this.profileImage;
    data['socketId'] = this.socketId;
    return data;
  }
}

class AstrologerId {
  String? sId;
  String? realName;
  String? profileImage;
  String? displayName;
  String? socketId;

  AstrologerId({
    this.sId,
    this.realName,
    this.profileImage,
    this.displayName,
    this.socketId,
  });

  AstrologerId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    realName = json['realName'];
    profileImage = json['profileImage'];
    displayName = json['displayName'];
    socketId = json['socketId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['realName'] = this.realName;
    data['profileImage'] = this.profileImage;
    data['displayName'] = this.displayName;
    data['socketId'] = this.socketId;
    return data;
  }
}
