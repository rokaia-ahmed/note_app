import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class  SqlDb{
  static Database? _db;
  Future<Database?> get db async{
    if(_db==null)
    {
      _db= await initialDb();
      return _db;
    }
    else{
      return _db;
    }
  }




  initialDb() async{
    String databasepath= await getDatabasesPath();
    String path= join(databasepath,'noteApp.db');
    Database mydb= await openDatabase(path,onCreate: _onCreate,version: 1,);
    return mydb;
  }


  _onCreate(Database db, int version) async{
    print('on create ');
    db.execute('''CREATE TABLE User (
    "id" INTEGER PRIMARY KEY, 
    "title" TEXT,
    "content" TEXT,
    "isFavorite" TEXT
    )''');

  }

  readDatabase(String sql) async {
    Database? myDb= await db;
    List<Map> response=await myDb!.rawQuery(sql);
    return response;

  }
  insertDatabase(String sql, List<Object> list) async {
    Database? myDb= await db;
    int response= await myDb!.rawInsert(sql,list);
    return response;

  }
  updateDatabase(String sql ,List<Object> list) async {
    Database? myDb= await db;
    int response=await myDb!.rawUpdate(sql,list);
    return response;

  }
  deleteDatabase(String sql) async {
    Database? myDb= await db;
    int response=await myDb!.rawDelete(sql);
    return response;

  }
}