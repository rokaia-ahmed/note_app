import 'package:bloc/bloc.dart';
import 'package:notes/controller/home/states.dart';
import 'package:notes/models/notes_model.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/db_config.dart';

class NotesCubit  extends Cubit<NotesStates>{
  NotesCubit() : super(NotesInitialState());

  List<NoteModel> Alltasks=[];
  List<NoteModel> Favourietasks=[];
  SqlDb sqldb=SqlDb() ;



  /*void getFromDb()
  {
    Alltasks=[];
    Favourietasks=[];

    emit(NotesgetDbLoadingState());
    database=sqldb.initialDb();
   Alltasks= sqldb.readDatabase();
   Alltasks.forEach((element) {
     if(element["isFavorite"]==1)
       {
         Favourietasks.add(element);
       }
   });
    emit(NotesgetDbState());

}*/

  List<NoteModel>getAllTask(){
    sqldb.readDatabase().then((notes)
    {//emit= start the state
      Favourietasks=[];

      this.Alltasks=notes;
      notes.forEach((element) {
        if(element.isaFavorite==1)
          {
           Favourietasks.add(element);
          }
        emit(NotesgetDbLoadingState(notes,Favourietasks));
      });



    });
    return [];
  }
void insertToDb(String title,String content,int isFav)
{

sqldb.insertDatabase(title,content,isFav);
emit(NotesInsertDbState());
getAllTask();

}
void updateContent(String content,int id)
{
  sqldb.updateContentDatabase(content, id);
  getAllTask();
  emit(NotesUpdateDbState());

}

  void updateFav(int isFav,int id)async
  {
    sqldb.updateFavDatabase(isFav, id);
    getAllTask();
    emit(NotesUpdateDbState());

  }
  void deleteData(int id)
  {
     sqldb.deleteDatabase(id);
     getAllTask();
     emit(NotesDeleteDbState());


  }

}
