import 'package:notes/models/notes_model.dart';

abstract class NotesStates {}

class NotesInitialState extends NotesStates {}
class NotesCreateDbState extends NotesStates {}
class NotesgetDbLoadingState extends NotesStates {
  final List<NoteModel> allNotes;
  NotesgetDbLoadingState(this.allNotes);

}
class NotesgetFavNotesState extends NotesStates {
  final List<NoteModel> favNotes;
  NotesgetFavNotesState(this.favNotes);

}
class NotesgetDbState extends NotesStates {}
class NotesUpdateDbState extends NotesStates {}
class NotesInsertDbState extends NotesStates {

}
class NotesDeleteDbState extends NotesStates {}