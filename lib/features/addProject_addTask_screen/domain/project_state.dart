import 'package:flutter/cupertino.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:taskfull/models/project.dart';
import 'package:taskfull/models/user.dart';

class ProjectState {
  final int id;
  final TextEditingController title;
  final TextEditingController note;
  final DateTime date;
  // final List<Project> projectTaskList;
  // final List<Project> projectList;

  ProjectState({
    required this.id,
    required this.title,
    required this.note,
    required this.date,
    // required this.projectList,
    // required this.projectTaskList
  });

  factory ProjectState.initial() {
    return ProjectState(
      id: 0,
      title: TextEditingController(),
      note: TextEditingController(),
      date: DateTime.now(),
      // projectTaskList: [],
      // projectList: []
    );
  }
  ProjectState copyWith({
    int? id,
    TextEditingController? title,
    TextEditingController? note,
    DateTime? date,
    //List<Project>? projectList,
    //List<Project>? projectTaskList,
  }) {
    return ProjectState(
      id: id ?? this.id,
      date: date ?? this.date,
      title: title ?? this.title,
      note: note ?? this.note,
      // projectList: projectList ?? this.projectList,
      //projectTaskList: projectTaskList ?? this.projectTaskList,
    );
  }
}
