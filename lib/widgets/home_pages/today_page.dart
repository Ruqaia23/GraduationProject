import 'package:flutter/material.dart';
import 'package:taskfull/config/theme.dart';

class TodayPage extends StatelessWidget {
  final String projectName;
  final String description;
  final bool isDone;
  const TodayPage(
      {super.key,
      required this.projectName,
      required this.description,
      required this.isDone});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 7,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: Container(
                height: 100,
                alignment: Alignment.center,
                child: ListTile(
                    minLeadingWidth: 100,
                    title: Text(
                      projectName,
                      style: CustomFontStyle().bold(20, Colors.black),
                    ),
                    subtitle: Text(
                      description * 5,
                      style: CustomFontStyle().normal(15, Colors.white),
                    ),
                    trailing: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    )),
              ));
        },
      ),
    );
  }
}
