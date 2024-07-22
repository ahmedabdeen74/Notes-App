import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constant/constant.dart';
import 'package:notes_app/cubits/notes_cubit/cubit/notescubit_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/colors_ListView.dart';
import 'package:notes_app/views/widgets/custom_bar.dart';
import 'package:notes_app/views/widgets/custom_textField.dart';

class EditNoteView extends StatefulWidget {
  const EditNoteView({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(
            height: 35,
          ),
          CustomNotesBar(
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.subTitle = subTitle ?? widget.note.subTitle;
              widget.note.save();
              BlocProvider.of<Notescubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
            iconData: Icons.check,
            text: 'Edit Note',
          ),
          const SizedBox(
            height: 30,
          ),
          CustomTextField(
              onChanged: (value) {
                title = value;
              },
              hint: widget.note.title),
          const SizedBox(
            height: 15,
          ),
          CustomTextField(
            onChanged: (value) {
              subTitle = value;
            },
            hint: widget.note.subTitle,
            maxLines: 6,
          ),
          const SizedBox(
            height: 16,
          ),
          EditNoteColorsList(note: widget.note),
        ],
      ),
    ));
  }
}

class EditNoteColorsList extends StatefulWidget {
  const EditNoteColorsList({super.key, required this.note});
  final NoteModel note;
  @override
  State<EditNoteColorsList> createState() => _EditNoteColorsListState();
}

class _EditNoteColorsListState extends State<EditNoteColorsList> {
  late int currentIndex;
  @override
  void initState() {
    currentIndex = kColors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: kColors.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: GestureDetector(
                  onTap: () {
                    currentIndex = index;
                    widget.note.color = kColors[index].value;
                    setState(() {});
                  },
                  child: ColorItem(
                    color: kColors[index],
                    isActive: currentIndex == index,
                  )),
            );
          }),
    );
  }
}
