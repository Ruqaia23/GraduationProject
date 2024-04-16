class Tasks {
  int? id;
  String? title;
  String? note;
  int? date;
  int? startDate;
  int? endDate;
  int? remind;
  String? isCompleted;

  Tasks(
      {this.id,
      this.title,
      this.note,
      this.date,
      this.startDate,
      this.endDate,
      this.remind,
      this.isCompleted});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "note": note,
      "date": date,
      "startDate": startDate,
      "endDate": endDate,
      "remind": remind,
      "isCompleted": isCompleted,
    };
  }

  Tasks.fromMap(Map<dynamic, dynamic> map) {
    id = map['id'];
    title = map['title'];
    note = map['note'];
    date = map['date'];
    startDate = map['startDate'];
    endDate = map['endDate'];
    remind = map['remind'];
    isCompleted = map['isCompleted'];
  }

  @override
  String toString() {
    return toMap().toString();
  }
}
