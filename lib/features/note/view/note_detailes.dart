import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskfull/config/config.dart';
import 'package:taskfull/config/theme.dart';
import 'package:taskfull/models/note_model.dart';

class NoteDetailScreen extends StatelessWidget {
  final NoteModel note;

  const NoteDetailScreen({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,

      appBar: AppBar(
        elevation: 0,
        leading:IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back, color: word,)) ,
        backgroundColor: kBackgroundColor,
        foregroundColor:kBackgroundColor ,
        title: Text("Note Detail",style: TextStyle(
          color: word
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title!,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: word),
            ),
            SizedBox(height: 10),
            Text(
              note.content!,
              style: TextStyle(fontSize: 18, color: word),
            ),
            SizedBox(height: 20),
            
          ],
        ),
      ),
    );
  }
}
