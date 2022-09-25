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
    String path= join(databasepath,'Facture.db');
    Database mydb= await openDatabase(path,onCreate: _onCreate,version: 1,);
    return mydb;
  }


  _onCreate(Database db, int version) async{
    print('on create ');
    db.execute('''CREATE TABLE User (
    "id" INTEGER PRIMARY KEY, 
    "title" TEXT,
    "content" TEXT,
    "isFavorite" INTEGER
    )''');

  }

  readDatabase() async {
    Database? myDb= await db;
    List<Map> response=await myDb!.rawQuery('SELECT * FROM "Note" ');
    return response;

  }
  insertDatabase(List<Object> list) async {
    Database? myDb= await db;
    int response= await myDb!.rawInsert("INSERT INTO 'Note' (title,content,isFavorite) VALUES (?,?,?)",list);
    return response;

  }
  updateDatabase(List<Object> list) async {
    Database? myDb= await db;
    int response=await myDb!.rawUpdate( "UPDATE 'Note' SET title = ?,content=? ,isFavorite=? WHERE id = ?",list);
    return response;

  }
  deleteDatabase(int id) async {
    Database? myDb= await db;
    int response=await myDb!.rawDelete('DELETE  FROM "Note" WHERE "id"=$id');
    return response;

  }
}