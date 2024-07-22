import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/cubit/notescubit_cubit.dart';
import 'package:notes_app/views/widgets/addNote_item.dart';
class AddNote extends StatelessWidget {
  const AddNote({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          child: BlocConsumer<AddNoteCubit, AddNoteState>(
            listener: (context, state) {
              if (state is AddNoteSuccess) {
                BlocProvider.of<Notescubit>(context).fetchAllNotes();
                Navigator.pop(context);
              }
              if (state is AddNoteFailre) {
                (' ${state.errrMessage}');
              }
            },
            builder: (context, state) {
              return AbsorbPointer(
                  absorbing: state is AddNoteLoading ? true : false,
                  child: const AddNoteItem());
            },
          ),
        ),
      ),
    );
  }
}
