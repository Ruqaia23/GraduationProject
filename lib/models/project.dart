class Projects {
  int? id;
  String? title;
  String? note;
  int? date;
  List? tasks;
  final String modifiefTime;

  String? isCompleted;

  Projects(this.modifiefTime,
      {this.id,
      this.title,
      this.note,
      this.date,
      this.tasks,
      this.isCompleted});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "note": note,
      "date": date,
      "tasks": tasks,
      "isCompleted": isCompleted,
    };
  }

  Projects.fromMap(Map<dynamic, dynamic> map, this.modifiefTime) {
    id = map['id'];
    title = map['title'];
    note = map['note'];
    date = map['date'];

    tasks = map['tasks'];
    isCompleted = map['isCompleted'];
  }

  @override
  String toString() {
    return toMap().toString();
  }
}
