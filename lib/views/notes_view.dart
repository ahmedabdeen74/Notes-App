import 'package:flutter/material.dart';
import 'package:notes_app/views/notes_viewBody.dart';
import 'package:notes_app/views/widgets/addNote.dart';
class NotesView extends StatelessWidget {
  const NotesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
              context: context,
              builder: (context) {
                return const AddNote();
              });
        },
        child: const Icon(Icons.add),
      ),
      body: const NotesViewBody(),
    );
  }
}
