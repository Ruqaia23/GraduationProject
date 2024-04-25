import 'package:flutter/material.dart';

class ProjectsModel {
  String? title;
  String? note;
  DateTime? date;

  ProjectsModel({
    this.title,
    this.note,
    this.date,
  });

  ProjectsModel.fromJson(Map<dynamic, dynamic> json) {
    title = json['title'];
    note = json['note'];
    date = json['date'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['title'] = title;
    data['note'] = note;
    data['date'] = date;

    return data;
  }
}
