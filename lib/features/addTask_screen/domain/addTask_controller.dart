import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:taskfull/features/addTask_screen/domain/addTask_state.dart';
import 'package:taskfull/features/personal_screen/domain/personal_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskfull/models/task.dart';

final taskProvider = StateNotifierProvider<TaskNotifier, ProjectState>((ref) {
  return TaskNotifier();
});

class TaskNotifier extends StateNotifier<ProjectState> {
  TaskNotifier() : super(ProjectState.initial());

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
      initialDate: state.date,
      firstDate: DateTime(2015),
      lastDate: DateTime(2121),
    );

    if (_pickerDate != null) {
      state = state.copyWith(date: _pickerDate);
    } else {
      print("it's null or something wrong!");
    }
  }

  selectStartTime(BuildContext context) async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null) {
      state = state.copyWith(startDate: selectedTime);
    } else {
      print("it's null or something wrong!");
    }
  }

  selectEndTime(BuildContext context) async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null) {
      state = state.copyWith(endDate: selectedTime);
    } else {
      print("it's null or something wrong!");
    }
  }
}
