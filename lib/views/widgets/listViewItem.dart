import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/controller/home/states.dart';
import 'package:notes/models/notes_model.dart';
import 'package:sqflite/sqflite.dart';

import '../../controller/home/cubit.dart';
import '../../models/db_config.dart';
import '../screens/edit_screen.dart';

class listViewItem extends StatelessWidget {

  NoteModel note;
  listViewItem({required this.note});
  @override
  Widget build(BuildContext context) {

    return Dismissible(
      background: buildSwipeActionRight(),
      key: Key('id'),
      onDismissed: (direction){
        //NotesCubit.get(context).deleteData(note?.id);
        BlocProvider.of<NotesCubit>(context).deleteData(note.id!);
      },
      child: Container(
        width: double.infinity,
        // margin: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.blue),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  note.title!,
                  style:const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                InkWell(
                  onTap: (){

                    if(note.isaFavorite==0) {
                      BlocProvider.of<NotesCubit>(context).updateFav(1, (note.id)!);

                    } else {
                      BlocProvider.of<NotesCubit>(context).updateFav(0, (note.id)!);
                    }
                  },
                  child:   note.isaFavorite==0?
                  Icon(Icons.favorite_border):
                  Icon(Icons.favorite,color: Colors.red,),
                ),
                SizedBox(width: 10),
                InkWell(
                  onTap:(){
                    Navigator.push(context,MaterialPageRoute(
                        builder: (context)=>EditNote(note: note!)
                    ),
                    );

                  } ,
                  child: Icon(Icons.edit,
                    // size: 12,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: Text(
                note.content!,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSwipeActionRight() => Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: Colors.red,
        child: Icon(Icons.delete_forever, color: Colors.white, size: 32),
      );
}
