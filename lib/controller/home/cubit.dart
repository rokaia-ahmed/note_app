import 'package:bloc/bloc.dart';
import 'package:notes/controller/home/states.dart';


import '../../models/db_config.dart';
import '../../models/notes_model.dart';

class NotesCubit  extends Cubit<NotesStates>{
  NotesCubit(this.sqldb) : super(NotesInitialState());

  List<Map> Alltasks=[];
  List<Map> Favourietasks=[];
  SqlDb sqldb =SqlDb() ;
  //late Database database;


  void getFromDb()
  {
    Alltasks=[];
    Favourietasks=[];

    emit(NotesgetDbLoadingState());

   Alltasks= sqldb.readDatabase();
   Alltasks.forEach((element) {
     if(element["isFavorite"]==1)
       {
         Favourietasks.add(element);
       }
   });
    emit(NotesgetDbState());

}
void insertToDb(List<NoteModel> list)
{

  sqldb.insertDatabase(title,content,isFav);
emit(NotesInsertDbState());
getFromDb();

}
void updateContent(String content,int id)
{
  sqldb.updateContentDatabase(content, id);
  getFromDb();
  emit(NotesUpdateDbState());

}

  void updateFav(int isFav,int id)async
  {
    sqldb.updateFavDatabase(isFav, id);
    getFromDb();
    emit(NotesUpdateDbState());

  }
  void deleteData(int id)
  {
     sqldb.deleteDatabase(id);
     getFromDb();
     emit(NotesDeleteDbState());


  }

}