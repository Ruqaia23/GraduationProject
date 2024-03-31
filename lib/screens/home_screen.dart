import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:taskfull/config/config.dart';
import 'package:taskfull/config/theme.dart';
import 'package:taskfull/screens/add_project.dart';
import 'package:taskfull/screens/add_task.dart';
import 'package:taskfull/widgets/button.dart';
import 'package:taskfull/widgets/home_pages/all_page.dart';
import 'package:taskfull/widgets/home_pages/finished_page.dart';
import 'package:taskfull/widgets/home_pages/today_page.dart';
import 'package:taskfull/widgets/name_avatar_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(35, 53, 49, 100),
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
              color: Color.fromRGBO(203, 208, 95, 100),
              iconSize: 24,
              alignment: Alignment.centerLeft),
          actions: [
            Icon(
              Icons.search_outlined,
              color: Color.fromRGBO(203, 208, 95, 100),
              size: 24,
            ),

            /*CircleAvatar(
              backgroundImage: AssetImage('images/Vector.png'),
            ),*/
            SizedBox(
              width: 20,
            ),
          ]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromRGBO(35, 53, 49, 100),
        iconSize: 30,
        selectedItemColor: kgreen,
        unselectedItemColor: kgreen,
        unselectedFontSize: 0,
        selectedFontSize: 0,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.transparent,
            icon: Icon(Icons.home_outlined,
                size: 32, color: Color.fromRGBO(203, 208, 95, 100)),
            label: "Home",
          ),
          /*BottomNavigationBarItem(
            icon: Icon(Icons.create_outlined,
                size: 50, color: Color.fromRGBO(203, 208, 95, 100)),
            label: "create",

          ),*/
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined,
                size: 32, color: Color.fromRGBO(203, 208, 95, 100)),
            label: "note",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline,
                size: 32, color: Color.fromRGBO(203, 208, 95, 100)),
            label: "person",
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //fisrt in the page
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  NameAvatarWidget(
                    name: "Ruqia Alqhuawaizi",
                    avatarUrl: "",
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "My Tasks",
                      style: CustomFontStyle().bold(23, Colors.black),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddTask())),
                    icon: Icon(
                      Icons.add,
                      color: kgreen,
                      size: 40,
                    ),
                  )
                ],
              ),
            ),
            // all - today -finshed Bar
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        currentIndex = 0;
                      });
                    },
                    child: Text(
                      "All",
                      style: CustomFontStyle().normal(
                        20,
                        currentIndex == 0
                            ? Color.fromRGBO(203, 208, 95, 1)
                            : Colors.black,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        currentIndex = 1;
                      });
                    },
                    child: Text(
                      "Today",
                      style: CustomFontStyle().normal(
                        20,
                        currentIndex == 1
                            ? Color.fromRGBO(203, 208, 95, 1)
                            : Colors.black,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        currentIndex = 2;
                      });
                    },
                    child: Text(
                      "Finished",
                      style: CustomFontStyle().normal(
                        20,
                        currentIndex == 2
                            ? Color.fromRGBO(203, 208, 95, 1)
                            : Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            if (currentIndex == 0) AllPage(),
            if (currentIndex == 1)
              TodayPage(
                projectName: "Project Name",
                description: "Description, ",
                isDone: true,
              ),
            if (currentIndex == 2)
              FinishedPage(
                projectName: "Project Name",
                description: "Description, ",
                isDone: true,
              ),
          ],
        ),
      ),
    );
  }
}
