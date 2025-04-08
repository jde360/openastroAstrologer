class OTPVerificationModel {
  String? token;
  bool? latest;

  OTPVerificationModel({this.token, this.latest});

  OTPVerificationModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    latest = json['latest'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['latest'] = latest;
    return data;
  }
}
