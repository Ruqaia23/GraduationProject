class NoteModel {
  int? id;
  String? title;
  String? content;
  DateTime? modifiefTime;

  NoteModel({this.title, this.content, this.id, this.modifiefTime});

  NoteModel.fromJson(Map<dynamic, dynamic> json) {
    title = json['title'];
    content = json['content'];
    modifiefTime = json['modifiefTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['content'] = this.content;
    data['modifiefTime'] = this.modifiefTime;
    return data;
  }

  @override
  String toString() {
    return '$title / $content / $modifiefTime';
  }
}
