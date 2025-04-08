class PujaModel {
  String? sId;
  String? name;

  PujaModel({this.sId, this.name});

  PujaModel.fromJson(Map<String, dynamic> json) {
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
