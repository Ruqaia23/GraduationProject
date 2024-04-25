import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:taskfull/data/hive_functions.dart';
import 'package:taskfull/features/addTask_screen/domain/addTask_state.dart';
import 'package:taskfull/features/personal_screen/domain/personal_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskfull/models/task.dart';
import 'package:taskfull/models/task_model.dart';

final taskProvider = StateNotifierProvider<TaskNotifier, TaskState>((ref) {
  return TaskNotifier();
});

class TaskNotifier extends StateNotifier<TaskState> {
  TaskNotifier() : super(TaskState.initial()) {
    getTasks();
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

  void getTasks() async {
    final res = await HiveFunc().getTasks();
    state = state.copyWith(taskList: res);
  }

  void newTask(BuildContext context) async {
    await HiveFunc().setNewTask(
      TaskModel(
        title: state.title.text,
        date: state.date,
        endDate: state.endDate,
        startDate: state.startDate,
        note: state.note.text,
        remind: state.remind,
      ),
    );
    state = state.copyWith(
      remind: 5,
      note: TextEditingController(),
      startDate: TimeOfDay.now(),
      endDate: TimeOfDay.now(),
      date: DateTime.now(),
      title: TextEditingController(),
    );
    getTasks();
    Navigator.pop(context);
  }
}
