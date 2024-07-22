import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/cubit/notescubit_cubit.dart';
import 'package:notes_app/views/widgets/custom_bar.dart';
import 'package:notes_app/views/widgets/notes_listView.dart';
class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});
  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<Notescubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(
              height: 35,
            ),
            CustomNotesBar(
              text: 'Notes',
              iconData: Icons.search,
            ),
            Expanded(child: NotesListView())
          ],
        ),
      ),
    );
  }
}
