import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:taskfull/models/project.dart';
import 'package:taskfull/models/task.dart';
import 'package:taskfull/models/task_model.dart';
import 'package:taskfull/models/user.dart';

class TaskState {
  final int id;
  final TextEditingController title;
  final TextEditingController note;
  final DateTime date;
  final TimeOfDay startDate;
  final TimeOfDay endDate;
  final int remind;
  final List<TaskModel> taskList;

  TaskState(
      {required this.id,
      required this.title,
      required this.note,
      required this.date,
      required this.startDate,
      required this.endDate,
      required this.remind,
      required this.taskList});

  factory TaskState.initial() {
    return TaskState(
        id: 0,
        title: TextEditingController(),
        note: TextEditingController(),
        date: DateTime.now(),
        startDate: TimeOfDay.now(),
        endDate: TimeOfDay.now(),
        remind: 5,
        taskList: []);
  }

  TaskState copyWith({
    int? id,
    int? done,
    TextEditingController? title,
    TextEditingController? note,
    DateTime? date,
    TimeOfDay? startDate,
    TimeOfDay? endDate,
    int? remind,
    List<TaskModel>? taskList,
  }) {
    return TaskState(
      id: id ?? this.id,
      date: date ?? this.date,
      title: title ?? this.title,
      note: note ?? this.note,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      remind: remind ?? this.remind,
      taskList: taskList ?? this.taskList,
    );
  }
}
