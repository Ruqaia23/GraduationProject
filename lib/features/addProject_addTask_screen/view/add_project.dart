import 'package:flutter/material.dart';
import 'package:taskfull/config/config.dart';
import 'package:intl/intl.dart';
import 'package:taskfull/config/theme.dart';
import 'package:taskfull/features/addProject_addTask_screen/domain/project_controller.dart';
import 'package:taskfull/widgets/Home/botton_Add_Task_project.dart';
import 'package:taskfull/widgets/button.dart';
import 'package:get/get.dart';
import 'package:taskfull/widgets/input_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectScreen extends ConsumerStatefulWidget {
  const ProjectScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _projectScreenState();
}

class _projectScreenState extends ConsumerState<ProjectScreen> {
  //String _endTime = "9:30 PM";
  //String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  //int _selectedRemind = 5;
  List<int> remindList = [
    5,
    10,
    15,
    20,
  ];

  List<String> ProjectList = [];
  List<String> projectTaskList = [];
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(projectProvider);
    final controller = ref.read(projectProvider.notifier);
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
            )),
        actions: [],
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Add Project",
                style: customText().bold(24, Colors.black),
              ),
              MyInputField(
                title: "title",
                hint: "Enter your Title",
                controller: null,
                widget: null,
              ),
              MyInputField(
                title: "note",
                hint: "Enter your note",
                controller: null,
                widget: null,
              ),
              MyInputField(
                title: "Date",
                hint: DateFormat.yMd().format(state.date as DateTime),
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
              MyInputField(
                title: "Project Tasks",
                hint: "Add The Task you want to Project",
                controller: null,
                widget: IconButton(
                  icon: Icon(
                    Icons.add,
                    color: kgreen,
                  ),
                  onPressed: () {
                    setState(() {
                      projectTaskList.add("");
                    });
                  },
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: projectTaskList.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Expanded(
                        child: TextField(
                          onChanged: (value) {
                            projectTaskList[index] = value;
                          },
                          decoration: InputDecoration(
                            hintText: "Add Task",
                            hintStyle: TextStyle(color: bwhite),
                          ),
                          style: CustomFontStyle().normal(14, bwhite),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.delete_outline_outlined,
                          color: kgreen,
                        ),
                        onPressed: () {
                          setState(() {
                            projectTaskList.removeAt(index);
                          });
                        },
                      ),
                    ],
                  );
                },
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: CreateButton(
                      lebel: "Create  ",
                      onTap: () {
                        print("object");
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
