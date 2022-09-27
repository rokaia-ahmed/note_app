import 'package:notes/models/notes_model.dart';

abstract class NotesStates {}

class NotesInitialState extends NotesStates {}
class NotesLoadingState extends NotesStates {}
class NotesEmptyeDbState extends NotesStates {
  bool ? isEmptyList;
  NotesEmptyeDbState(this.isEmptyList);
}
class NotesgetDbLoadingState extends NotesStates {
  final List<NoteModel> allNotes;
  final List<NoteModel> favtasks;
  NotesgetDbLoadingState(this.allNotes,this.favtasks);

}
class NotesgetFavNotesState extends NotesStates {
  final List<NoteModel> favNotes;
  NotesgetFavNotesState(this.favNotes);

}
class ShowNotesInViewState extends NotesStates {
  ShowNotesInViewState(this.inList);
  bool inList = true;

}
class NotesUpdateDbState extends NotesStates {}
class NotesInsertDbState extends NotesStates {

}
class NotesDeleteDbState extends NotesStates {}