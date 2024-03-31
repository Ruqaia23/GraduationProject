import 'package:flutter/material.dart';
import 'package:taskfull/config/config.dart';
import 'package:taskfull/config/theme.dart';
import 'package:taskfull/config/theme.dart';
import 'package:taskfull/screens/my_note.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 40, 16, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: bwhite,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 230),
                  child: Text(
                    "Notes",
                    style: customText().bold(24, bwhite),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: ListView(
                  children: const [
                    TextField(
                      style: TextStyle(color: bwhite, fontSize: 30),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Title',
                          hintStyle: TextStyle(
                              color: bwhite,
                              fontSize: 30,
                              fontWeight: FontWeight.normal)),
                    ),
                    TextField(
                      style: TextStyle(color: bwhite, fontSize: 17),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Type somthing here',
                          hintStyle: TextStyle(
                              color: bwhite,
                              fontSize: 17,
                              fontWeight: FontWeight.normal)),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0x61233531),
        child: const Icon(
          Icons.save,
          size: 38,
          color: kgreen,
        ),
      ),
    );
  }
}
