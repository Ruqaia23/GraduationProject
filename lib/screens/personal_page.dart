import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:taskfull/config/config.dart';
import 'package:taskfull/config/theme.dart';
import 'package:taskfull/widgets/daily_steps_container.dart';
import 'package:taskfull/widgets/name_avatar_widget.dart';
import 'package:taskfull/widgets/progress_bar_widget.dart';

class PersonalPage extends StatelessWidget {
  const PersonalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(35, 53, 49, 100),
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
                size: 30,
              )),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Color.fromRGBO(203, 208, 95, 1),
                  size: 30,
                )),
          ),
        ],
      ),
      backgroundColor: const Color.fromRGBO(35, 53, 49, 100),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(35, 53, 49, 0),
                Color.fromRGBO(35, 53, 49, 100),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Column(
                children: [
                  // Header Section
                  NameAvatarWidget(
                    name: "Ruqia Alqhuawaizi",
                    avatarUrl: "",
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  // Body Section
                  ProgressBarWidget(
                    totalProject: "00",
                    doneProject: "00",
                    inProgressProject: "00",
                    pendingProject: "00",
                  ),

                  SizedBox(
                    height: 100,
                  ),
                  // Footer Section
                  DailyStepsWidget(steps: "3000"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
