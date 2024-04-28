import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:taskfull/config/config.dart';
import 'package:intl/intl.dart';
import 'package:taskfull/config/theme.dart';
import 'package:taskfull/features/addProject_addTask_screen/domain/project_controller.dart';
import 'package:taskfull/features/addProject_addTask_screen/domain/project_state.dart';
import 'package:taskfull/screens/map.dart';
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
  List<int> remindList = [
    5,
    10,
    15,
    20,
  ];
  

  List<String> projectTaskList = [];
  
  Future<void> _navigateToMapScreen(BuildContext context) async {
  final selectedLocation = await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => MapScreen()),
  );
  }


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
          ),
        ),
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
              MyprojectInputField(
                title: "title",
                projecthint: "Enter your Title",
                projectcontroller: state.title,
                projectwidget: null,
              ),
              MyprojectInputField(
                title: "note",
                projecthint: "Enter your note",
                projectcontroller: state.note,
                projectwidget: null,
              ),
              MyprojectInputField(
                title: "Date",
                projecthint: DateFormat.yMd().format(state.date as DateTime),
                projectcontroller:
                    TextEditingController(text: state.date.toString()),
                projectwidget: IconButton(
                  icon: Icon(
                    Icons.calendar_today_outlined,
                    color: kgreen,
                  ),
                  onPressed: () {
                    controller.getDateFormUser(context);
                  },
                ),
              ),
              MyprojectInputField(
                title: "Project Tasks",
                projecthint: "Add The Task you want to Project",
                projectcontroller: null,
                projectwidget: IconButton(
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
              const SizedBox(
                height: 50,
              ),
               GestureDetector(
                onTap: (){
                      _navigateToMapScreen(context);

                  print("I'm maps button , you presed on me ");
                },
                 child: Container(
                   child: Row(
                    children: [
                      Icon(Icons.add, color: kgreen,),
                      Text(
                        'Add place',
                        style:  CustomFontStyle().normal(16, kgreen),
                   
                      ),
                    ],
                                 ),
                 ),
               ),
              //google map >> new page
     
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: CreateButton(
                        lebel: "Create  ",
                        onTap: () => controller.newProject(context)),

                    /* final projectData = {
                          'title': state.title.text,
                          'note': state.note.text,
                          'date': state.date.toString(),
                          'tasks': projectTaskList,
                        };

                        final box = await Hive.openBox('projects');
                        box.add(projectData);

                        Navigator.pop(context);*/
                  ),
                ],
              ), 
               
            ],
          ),
        ),
      ),
    );
  }
}
