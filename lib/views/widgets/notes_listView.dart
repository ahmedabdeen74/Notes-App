import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/cubit/notescubit_cubit.dart';

import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/custom_noteItem.dart';
class NotesListView extends StatelessWidget {
  const NotesListView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Notescubit,NotescubitState>(
      builder: (context, state) {
         List<NoteModel>notes =  BlocProvider.of<Notescubit>(context).notes!;
        return Padding(
          padding: const EdgeInsets.only(top: 16),
          child: ListView.builder(
            itemCount: notes.length,
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: CustomNoteItem(
                    note: notes[index],
                  ),

                );
              }),
        );
      },
    );
  }
}
