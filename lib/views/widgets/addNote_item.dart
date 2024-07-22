import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/colors_ListView.dart';
import 'package:notes_app/views/widgets/custom_textField.dart';
import 'add_note_button.dart';
class AddNoteItem extends StatefulWidget {
  const AddNoteItem({
    super.key,
  });

  @override
  State<AddNoteItem> createState() => _AddNoteItemState();
}
class _AddNoteItemState extends State<AddNoteItem> {
  final GlobalKey<FormState> formKey = GlobalKey();
  String? title, subTitle;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formKey,
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(
                  right: 16, left: 16, bottom: 16, top: 32),
              child: CustomTextField(
                onSaved: (data) {
                  title = data;
                },
                hint: 'Title',
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomTextField(
              onSaved: (data) {
                subTitle = data;
              },
              hint: 'Content',
              maxLines: 6,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ColorsListView(),
          ),
          const SizedBox(
            height: 25,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return AddNoteButton(
                isLoading: state is AddNoteLoading ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var currentDate = DateTime.now();
                    var formattedCurrentData = DateFormat.yMd().format(currentDate);
                    var noteModel = NoteModel(
                        title: title!,
                        subTitle: subTitle!,
                        date: formattedCurrentData,
                        color: Colors.black.value);
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
