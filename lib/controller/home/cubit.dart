import 'package:bloc/bloc.dart';
import 'package:notes/controller/home/states.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/db_config.dart';

class NotesCubit  extends Cubit<NotesStates>{
  NotesCubit(this.sqldb) : super(NotesInitialState());

  List<Map> Alltasks=[];
  List<Map> Favourietasks=[];
  final SqlDb sqldb ;
  late Database database;


  void getFromDb()
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

}
void insertToDb(List<Object> list)
{

sqldb.insertDatabase(list);
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