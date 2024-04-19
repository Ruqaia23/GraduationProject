import 'package:flutter/material.dart';
import 'package:taskfull/config/config.dart';
import 'package:intl/intl.dart';
import 'package:taskfull/config/theme.dart';
import 'package:taskfull/features/addTask_screen/domain/addTask_controller.dart';
import 'package:taskfull/models/task.dart';
import 'package:taskfull/widgets/Home/botton_Add_Task_project.dart';
import 'package:taskfull/widgets/button.dart';
import 'package:get/get.dart';
import 'package:taskfull/widgets/input_field.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

class TaskScreen extends ConsumerStatefulWidget {
  const TaskScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _taskScreenState();
}

class _taskScreenState extends ConsumerState<TaskScreen> {
  int _selectedRemind = 5;
  List<int> remindList = [
    5,
    10,
    15,
    20,
  ];

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(taskProvider);
    final controller = ref.read(taskProvider.notifier);
    final String _startTime =
        MaterialLocalizations.of(context).formatTimeOfDay(state.startDate);
    final String _endTime =
        MaterialLocalizations.of(context).formatTimeOfDay(state.endDate);

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Color.fromRGBO(203, 208, 95, 100),
            size: 24,
          ),
        ),
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 235.0),
                child: Text(
                  "Add Task",
                  style: customText().bold(24, Colors.black),
                ),
              ),
              MyInputField(
                title: "title",
                hint: "Enter your Title",
                controller: state.title,
                widget: null,
              ),
              MyInputField(
                title: "note",
                hint: "Enter your note",
                controller: state.note,
                widget: null,
              ),
              MyInputField(
                title: "Date",
                hint: DateFormat.yMd().format(state.date),
                controller: null,
                widget: IconButton(
                  icon: Icon(
                    Icons.calendar_today_outlined,
                    color: kgreen,
                  ),
                  onPressed: () {
                    controller.getDateFormUser(context);
                  },
                ),
              ),
              SizedBox(height: 7), // Added SizedBox
              Row(
                children: [
                  Expanded(
                    child: MyInputField(
                      title: "start Date",
                      hint: _startTime,
                      widget: IconButton(
                        onPressed: () {
                          controller.selectStartTime(context);
                        },
                        icon: Icon(Icons.access_time_filled_rounded,
                            color: kgreen),
                      ),
                      controller: null,
                    ),
                  ),
                  SizedBox(width: 20), // Added SizedBox
                  Expanded(
                    child: MyInputField(
                      title: "end Date",
                      hint: _endTime,
                      widget: IconButton(
                        onPressed: () {
                          controller.selectEndTime(context);
                        },
                        icon: Icon(Icons.access_time_filled_rounded,
                            color: kgreen),
                      ),
                      controller: null,
                    ),
                  ),
                ],
              ),

              MyInputField(
                title: "Remind",
                hint: "$_selectedRemind minutes early",
                controller: null,
                widget: DropdownButton<String>(
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: kgreen,
                  ),
                  iconSize: 32,
                  elevation: 4,
                  underline: Container(
                    height: 0,
                  ),
                  items: remindList.map<DropdownMenuItem<String>>((int value) {
                    return DropdownMenuItem<String>(
                      value: value.toString(),
                      child: Text(value.toString()),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _selectedRemind = int.parse(value!);
                    });
                  },
                ),
              ),
              //google map >> new page
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: CreateButton(
                        lebel: "Create  ",
                        onTap: () => controller.validateDate()),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  /*_AddTaskToDb() async {
    int value = await _taskController.addTask(
      task: Task(
        note: _noteController.text,
        title: _titleController.text,
        date: DateFormat.yMd().format(_selectedDate),
        startDate: _startTime,
        endDate: _endTime,
        remind: _selectedRemind,
        isCompleted: 0,
      ),
    );
    print("My id is " + "$value");
  }*/
}
