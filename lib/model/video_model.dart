class VideoModel {
  String? description;
  List<String>? sources;
  String? subtitle;
  String? thumb;
  String? title;

  VideoModel(
      {this.description, this.sources, this.subtitle, this.thumb, this.title});

  VideoModel.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    sources = json['sources'].cast<String>();
    subtitle = json['subtitle'];
    thumb = json['thumb'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['sources'] = sources;
    data['subtitle'] = subtitle;
    data['thumb'] = thumb;
    data['title'] = title;
    return data;
  }
}
