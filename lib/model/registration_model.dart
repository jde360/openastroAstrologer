class RegistrationModel {
  String? displayName;
  String? realName;
  String? experience;
  String? desc;
  List<String>? specializations;
  List<String>? puja;
  String? chatActive;
  String? callActive;
  String? videoCallActive;

  RegistrationModel({
    this.displayName,
    this.realName,
    this.experience,
    this.desc,
    this.specializations,
    this.puja,
    this.chatActive,
    this.callActive,
    this.videoCallActive,
  });

  RegistrationModel.fromJson(Map<String, dynamic> json) {
    displayName = json['displayName'];
    realName = json['realName'];
    experience = json['experience'];
    desc = json['desc'];
    specializations = (json['specializations'] as List?)?.cast<String>();
    puja = (json['puja'] as List?)?.cast<String>();
    chatActive = json['chatActive'];
    callActive = json['callActive'];
    videoCallActive = json['videoCallActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['displayName'] = this.displayName;
    data['realName'] = this.realName;
    data['experience'] = this.experience;
    data['desc'] = this.desc;
    data['specializations'] = this.specializations;
    data['puja'] = this.puja;
    data['chatActive'] = this.chatActive;
    data['callActive'] = this.callActive;
    data['videoCallActive'] = this.videoCallActive;
    return data;
  }
}
