import 'package:flutter/material.dart';
import 'package:taskfull/config/config.dart';
import 'package:taskfull/config/theme.dart';
import 'package:taskfull/features/note/controller.dart';
import 'package:taskfull/screens/my_note.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditScreen extends ConsumerStatefulWidget {
  const EditScreen({super.key});

  @override
  ConsumerState createState() => _EditScreenState();
}

class _EditScreenState extends ConsumerState<EditScreen> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(notesProvider);
    final controller = ref.read(notesProvider.notifier);
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
        title: Column(
          children: [
            Text(
              "Notes",
              style: customText().bold(24, bwhite),
            ),
          ],
        ),
        actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 40, 16, 0),
        child: Column(
          children: [
            /*Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Notes",
                  style: customText().bold(24, bwhite),
                ),
              ],
            ),*/
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: ListView(
                  children: [
                    TextField(
                      controller: state.title,
                      style: TextStyle(color: bwhite, fontSize: 30),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Title',
                        hintStyle: TextStyle(
                          color: bwhite,
                          fontSize: 30,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    TextField(
                      controller: state.content,
                      style: TextStyle(color: bwhite, fontSize: 17),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Type something here',
                        hintStyle: TextStyle(
                          color: bwhite,
                          fontSize: 17,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.addNote(context),
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
