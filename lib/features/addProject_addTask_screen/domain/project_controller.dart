import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:taskfull/data/hive_functions.dart';
import 'package:taskfull/features/addProject_addTask_screen/domain/project_state.dart';
import 'package:taskfull/features/addTask_screen/domain/addTask_state.dart';
import 'package:taskfull/features/personal_screen/domain/personal_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskfull/models/project.dart';
import 'package:taskfull/models/task.dart';

final projectProvider =
    StateNotifierProvider<ProjectNotifier, ProjectState>((ref) {
  return ProjectNotifier();
});

class ProjectNotifier extends StateNotifier<ProjectState> {
  ProjectNotifier() : super(ProjectState.initial()) {
    getProjects();
  }

  validateDate() {
    if (state.title.text.isNotEmpty && state.note.text.isNotEmpty) {
      //_AddTaskToDb();
      Get.back();
    } else if (state.title.text.isEmpty || state.note.text.isEmpty) {
      Get.snackbar("Required", "All fields are required!",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white,
          icon: Icon(
            Icons.warning_amber_rounded,
            color: Colors.red,
          ));
    }
  }

  getDateFormUser(BuildContext context) async {
    DateTime? _pickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2121),
    );

    if (_pickerDate != null) {
      state = state.copyWith(date: _pickerDate);
    } else {
      print("it's null or something wrong!");
    }
  }

  void getProjects() async {
    final res = await HiveFunc().getProjects();
    state = state.copyWith(projectList: res);
  }

  void newProject(BuildContext context) async {
    await HiveFunc().setNewProject(
      ProjectsModel(
        title: state.title.text,
        date: state.date,
        note: state.note.text,
      ),
    );


    state = state.copyWith(
      note: TextEditingController(),
      date: DateTime.now(),
      title: TextEditingController(),
    );
    getProjects();
    Navigator.pop(context);
  }
}
