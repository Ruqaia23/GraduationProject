import 'package:flutter/material.dart';
import 'package:taskfull/config/config.dart';
import 'package:taskfull/config/theme.dart';
import 'package:intl/intl.dart';

import 'package:taskfull/models/note.dart';
import 'package:taskfull/screens/add_note.dart';

class MyNotes extends StatefulWidget {
  const MyNotes({Key? key}) : super(key: key);

  @override
  State<MyNotes> createState() => _MyNotesState();
}

class _MyNotesState extends State<MyNotes> {
  List<Note> filteredNotes = [];
  bool sorted = false;
  @override
  void initState() {
    super.initState();
    filteredNotes = sampleNotes;
  }

  List<Note> sortNotedByModifiedTime(List<Note> notes) {
    if (sorted) {
      notes.sort((a, b) => a.modifiefTime.compareTo(b.modifiefTime));
    } else {
      notes.sort((b, a) => a.modifiefTime.compareTo(b.modifiefTime));
    }

    sorted = !sorted;
    return notes;
  }

  void onSearchTextChanged(String searchText) {
    setState(() {
      filteredNotes = sampleNotes
          .where((note) =>
              note.content.toLowerCase().contains(searchText.toLowerCase()) ||
              note.title.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }

  void deleteNote(int index) {
    setState(() {
      Note note = filteredNotes[index];
      sampleNotes.remove(note);
      filteredNotes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
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
                Text(
                  "Notes",
                  style: customText().bold(24, bwhite),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      filteredNotes = sortNotedByModifiedTime(filteredNotes);
                    });
                  },
                  icon: Icon(
                    Icons.sort,
                    color: bwhite,
                  ),
                ),
              ],
            ),
            TextField(
              style: CustomFontStyle().normal(16, bwhite),
              onChanged: onSearchTextChanged,
              decoration: InputDecoration(
                hintText: "Search notes...",
                hintStyle: TextStyle(color: bwhite),
                prefixIcon: Icon(
                  Icons.search,
                  color: kgreen,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredNotes.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.only(bottom: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: word,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: ListTile(
                        title: RichText(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            text: "${filteredNotes[index].title} :\n",
                            style: CustomFontStyle().bold(20, bwhite),
                            children: [
                              TextSpan(
                                text: "${filteredNotes[index].content} :\n",
                                style: CustomFontStyle().normal(20, bwhite),
                              ),
                            ],
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Edeted:${DateFormat.yMd().format(filteredNotes[index].modifiefTime)} \n',
                            style: CustomFontStyle().normal(12, bwhite),
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () async {
                            final result = await confirmDialog(context);
                            if (result != null && result) {
                              deleteNote(index);
                            }
                          },
                          icon: Icon(
                            Icons.delete,
                            color: kgreen,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => const EditScreen(),
            ),
          );
        },
        elevation: 10,
        backgroundColor: Color(0x61233531),
        child: const Icon(
          Icons.add,
          size: 38,
          color: kgreen,
        ),
      ),
    );
  }

  Future<dynamic> confirmDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: kblue,
            icon: Icon(
              Icons.info,
              color: kgreen,
            ),
            title: Text(
              "Are You sure you want to delete?",
              style: TextStyle(color: bwhite),
            ),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kgreen,
                  ),
                  child: SizedBox(
                    width: 60,
                    child: Text(
                      "yes",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: bwhite),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: bwhite,
                  ),
                  child: SizedBox(
                    width: 60,
                    child: Text(
                      "no",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: kblue),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
