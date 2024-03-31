import 'package:flutter/material.dart';
import 'package:taskfull/config/config.dart';
import 'package:intl/intl.dart';
import 'package:taskfull/config/theme.dart';
import 'package:taskfull/widgets/Home/botton_Add_Task_project.dart';
import 'package:taskfull/widgets/button.dart';
import 'package:get/get.dart';
import 'package:taskfull/widgets/input_field.dart';

class AddProjects extends StatefulWidget {
  const AddProjects({Key? key}) : super(key: key);

  @override
  State<AddProjects> createState() => _AddProjectState();
}

class _AddProjectState extends State<AddProjects> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  String _endTime = "9:30 PM";
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  int _selectedRemind = 5;
  List<int> remindList = [
    5,
    10,
    15,
    20,
  ];

  List<String> tasks = [];
  DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
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
                hint: DateFormat.yMd().format(_selectedDate),
                controller: null,
                widget: IconButton(
                  icon: Icon(
                    Icons.calendar_today_outlined,
                    color: kgreen,
                  ),
                  onPressed: () {
                    _getDateFormUser();
                  },
                ),
              ),
              /*
              SizedBox(height: 7), // Added SizedBox
              Row(
                children: [
                  Expanded(
                    child: MyInputField(
                      title: "start Date",
                      hint: _startTime,
                      widget: IconButton(
                        onPressed: () {
                          _selectStartTime();
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
                          _selectEndTime();
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
              ),*/

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
                      tasks.add("");
                    });
                  },
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Expanded(
                        child: TextField(
                          onChanged: (value) {
                            tasks[index] = value;
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
                            tasks.removeAt(index);
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

  _validateDate() {
    if (_titleController.text.isNotEmpty && _noteController.text.isNotEmpty) {
      Get.back();
    } else if (_titleController.text.isEmpty || _noteController.text.isEmpty) {
      Get.snackbar("Required", "All fields are required!",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white,
          icon: Icon(
            Icons.warning_amber_rounded,
            color: Colors.red,
          ));
    }
  }

  _getDateFormUser() async {
    DateTime? _pickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2121),
    );

    if (_pickerDate != null) {
      setState(() {
        _selectedDate = _pickerDate;
        print(_selectedDate);
      });
    } else {
      print("it's null or something wrong!");
    }
  }

  _selectStartTime() async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null) {
      setState(() {
        _startTime = selectedTime.format(context);
        print(_startTime);
      });
    } else {
      print("it's null or something wrong!");
    }
  }

  _selectEndTime() async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null) {
      setState(() {
        _endTime = selectedTime.format(context);
        print(_endTime);
      });
    } else {
      print("it's null or something wrong!");
    }
  }
}
