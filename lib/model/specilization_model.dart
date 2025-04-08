class SpecializationModel {
  String? sId;
  String? name;

  SpecializationModel({this.sId, this.name});

  SpecializationModel.fromJson(Map<String, dynamic> json) {
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
