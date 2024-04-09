import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:taskfull/config/config.dart';
import 'package:taskfull/config/theme.dart';
import 'package:taskfull/screens/add_project.dart';
import 'package:taskfull/screens/add_task.dart';
import 'package:taskfull/screens/my_note.dart';
import 'package:taskfull/screens/personal_page.dart';
import 'package:taskfull/widgets/button.dart';
import 'package:taskfull/widgets/home_pages/all_page.dart';
import 'package:taskfull/widgets/home_pages/finished_page.dart';
import 'package:taskfull/widgets/home_pages/today_page.dart';
import 'package:taskfull/widgets/name_avatar_widget.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class HomeScreen extends StatefulWidget {
  // final String title;

  //HomeScreen({required this.title});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(35, 53, 49, 100),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // title: Text("widget."),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: CustomSearch());
            },
            icon: const Icon(
              Icons.search_outlined,
              color: Color.fromRGBO(203, 208, 95, 100),
              size: 32,
            ),
          ),
        ],
      ),

      /* elevation: 0,
        centerTitle: true,
        
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search_outlined,
            color: Color.fromRGBO(203, 208, 95, 100),
            size: 32,
          ),
        ),*/

      bottomNavigationBar: BottomNavyBar(
          onItemSelected: (index) {
            _pageController.jumpToPage(index);
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              inactiveColor: Colors.black,
              icon: Icon(Icons.home_outlined,
                  size: 32, color: Color.fromRGBO(203, 208, 95, 100)),
              title: Text("Home"),
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.article_outlined,
                  size: 32, color: Color.fromRGBO(203, 208, 95, 100)),
              title: Text("note"),
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.person_outline,
                  size: 32, color: Color.fromRGBO(203, 208, 95, 100)),
              title: Text("person"),
            ),
          ]),
      body: Center(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          children: [
            Column(
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
            MyNotes(),
            PersonalPage(),
          ],
        ),
      ),
    );
  }
}

class CustomSearch extends SearchDelegate {
  List<String> allData = ["workout", "My Grad project", "vist AOU"];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in allData) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in allData) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }
}
