import 'dart:ui';

import 'package:controller/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:taskfull/config/config.dart';
import 'package:taskfull/config/theme.dart';
import 'package:taskfull/features/addProject_addTask_screen/view/add_project.dart';
import 'package:taskfull/features/addTask_screen/domain/addTask_controller.dart';
import 'package:taskfull/widgets/button.dart';
import 'package:taskfull/widgets/home_pages/finished_page.dart';
import 'package:taskfull/widgets/home_pages/finished_page.dart';
import 'package:taskfull/widgets/home_pages/finished_page.dart';

class AllPage extends ConsumerStatefulWidget {
  const AllPage({super.key});

  @override
  ConsumerState createState() => _AllPageState();
}

class _AllPageState extends ConsumerState<AllPage> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(taskProvider);
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: state.taskList.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  var isDateTime;
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      width: 148,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(203, 208, 95, 100),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.all(8),
                            child: Container(
                              width: 75,
                              height: 20,
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  width: 1,
                                  color: Color.fromRGBO(63, 70, 151, 1),
                                ),
                              ),
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: Text(
                                  // state.date.isDateTime??'',
                                  'Date',
                                  style: customText().bold(
                                    16,
                                    Color.fromRGBO(63, 70, 151, 1),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 45,
                          ),
                          Text(
                            state.taskList[index].title ?? '',
                            style: customText().bold(
                              24,
                              Color.fromRGBO(63, 70, 151, 1),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          /* ElevatedButton(
                            onPressed: ()  {
                            }
                            child: Text(
                              'Delete',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),*/
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // //my projact
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "My Project",
                    style: CustomFontStyle().bold(24, Colors.black),
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProjectScreen())),
                  icon: Icon(
                    Icons.add,
                    color: kgreen,
                    size: 40,
                  ),
                )
              ],
            ),
          ),
          // //project contaier
          Expanded(
            child: ListView.builder(
              itemCount: 7,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: ScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    child: Container(
                      height: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: ListTile(
                        title: Text(
                          "Project name",
                          style: CustomFontStyle()
                              .bold(20, Color.fromRGBO(63, 70, 151, 1)),
                        ),
                        subtitle: Text(
                          'start',

                          //  ' ${DateFormat.yMd().format(DateTime.now())} \n',

                          //  style: CustomFontStyle()
                          //  .normal(15, Color.fromRGBO(63, 70, 151, 1)),
                        ),
                        leading: Icon(
                          Icons.note_alt,
                          size: 40,
                          color: Color.fromRGBO(63, 70, 151, 1),
                        ),
                        trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.menu,
                              color: Color.fromRGBO(63, 70, 151, 1),
                              size: 30,
                            )),
                      ),
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
