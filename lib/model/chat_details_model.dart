class ChatDetailsModel {
  String? sId;
  String? sender;
  String? receiver;
  String? senderType;
  String? message;
  bool? isRead;
  String? createdAt;
  String? updatedAt;
  int? iV;

  ChatDetailsModel({
    this.sId,
    this.sender,
    this.receiver,
    this.senderType,
    this.message,
    this.isRead,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  ChatDetailsModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    sender = json['sender'];
    receiver = json['receiver'];
    senderType = json['senderType'];
    message = json['message'];
    isRead = json['isRead'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['sender'] = this.sender;
    data['receiver'] = this.receiver;
    data['senderType'] = this.senderType;
    data['message'] = this.message;
    data['isRead'] = this.isRead;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
