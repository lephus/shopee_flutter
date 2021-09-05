class SlideModel {
  List<String> slide;

  SlideModel({this.slide});

  SlideModel.fromJson(Map<String, dynamic> json) {
    slide = json['slide'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['slide'] = slide;
    return data;
  }
}
