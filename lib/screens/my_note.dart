import 'package:flutter/material.dart';
import 'package:taskfull/config/config.dart';
import 'package:taskfull/config/theme.dart';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskfull/features/note/controller.dart';

import 'package:taskfull/models/note_model.dart';
import 'package:taskfull/screens/add_note.dart';

class MyNote extends ConsumerStatefulWidget {
  const MyNote({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyNoteState();
}

class _MyNoteState extends ConsumerState<MyNote> {
  List<NoteModel> filteredNotes = [];
  bool sorted = false;

  @override
  void initState() {
    super.initState();
    // filteredNotes = sampleNotes;
  }

  /*List<Note> sortNotedByModifiedTime(List<Note> notes) {
    if (sorted) {
      notes.sort((a, b) => a.modifiefTime.compareTo(b.modifiefTime));
    } else {
      notes.sort((b, a) => a.modifiefTime.compareTo(b.modifiefTime));
    }

    sorted = !sorted;
    return notes;
  }*/

  /*void onSearchTextChanged(String searchText) {
    setState(() {
     // filteredNotes = sampleNotes
          .where((note) =>
              note.content.toLowerCase().contains(searchText.toLowerCase()) ||
              note.title.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }*?

  void deleteNote(int index) {
    setState(() {
      // Note note = filteredNotes[index];
      // sampleNotes.remove(note);
      filteredNotes.removeAt(index);
    });
  }*/

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(notesProvider);
    final controller = ref.read(notesProvider.notifier);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              /*TextField(

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
              ),*/
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: state.notes.length,
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
                            text: "${state.notes[index].title} :\n",
                            style: CustomFontStyle().bold(20, bwhite),
                            children: [
                              TextSpan(
                                text: "${state.notes[index].content} :\n",
                                style: CustomFontStyle().normal(20, bwhite),
                              ),
                            ],
                          ),
                        ),
                        // subtitle: Padding(
                        //   padding: const EdgeInsets.only(top: 8.0),
                        //   child: Text(
                        //     'Edeted:${DateFormat.yMd().format(filteredNotes[index].modifiefTime)} \n',
                        //     style: CustomFontStyle().normal(12, bwhite),
                        //   ),
                        // ),
                        trailing: IconButton(
                          onPressed: () async {
                            final result = await confirmDialog(context, () {
                              controller.deleteNote(index, context);
                            });
                            if (result != null && result) {}
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
            ],
          ),
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

  Future<dynamic> confirmDialog(BuildContext context, Function() onPressed) {
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
                  onPressed: onPressed,
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
