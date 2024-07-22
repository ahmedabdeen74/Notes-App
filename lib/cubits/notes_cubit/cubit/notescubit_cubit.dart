import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constant/constant.dart';
import 'package:notes_app/models/note_model.dart';
part 'notescubit_state.dart';

class Notescubit extends Cubit<NotescubitState> {
  Notescubit() : super(NotescubitInitial());

  List<NoteModel>? notes;
  fetchAllNotes() {
    var noteBox = Hive.box<NoteModel>(kNotesBox);
    notes = noteBox.values.toList();
    emit(Notessuccess());
  
  }
}
