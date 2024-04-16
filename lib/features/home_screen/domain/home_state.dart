import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:taskfull/models/project.dart';
import 'package:taskfull/models/task.dart';
import 'package:taskfull/models/user.dart';

class HomeState {
  final int id;
  final List<Tasks> taskList;
  final List<Projects> projectList;

  HomeState({
    required this.id,
    required this.taskList,
    required this.projectList,
  });

  factory HomeState.initial() {
    return HomeState(
      id: 0,
      taskList: [],
      projectList: [],
    );
  }
  HomeState copyWith({
    int? id,
    List<Tasks>? taskList,
    List<Projects>? projectList,
  }) {
    return HomeState(
      id: id ?? this.id,
      taskList: taskList ?? this.taskList,
      projectList: projectList ?? this.projectList,
    );
  }
}
