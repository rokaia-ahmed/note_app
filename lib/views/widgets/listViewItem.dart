import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/models/notes_model.dart';
import '../../controller/home/cubit.dart';
import '../screens/edit_screen.dart';

class ListViewItem extends StatelessWidget {

 final NoteModel note;
 const ListViewItem({Key? key, required this.note}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Dismissible(
      background: buildSwipeActionRight(),
      key: const Key('id'),
      onDismissed: (direction){
        //NotesCubit.get(context).deleteData(note?.id);
        BlocProvider.of<NotesCubit>(context).deleteData(note.id!);
      },
      child: Container(
        width: double.infinity,
        // margin: EdgeInsets.all(10),
        margin:const EdgeInsets.all(10),
        padding:const EdgeInsets.all(10),
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
                 const Spacer(),
                InkWell(
                  onTap: (){

                    if(note.isaFavorite==0) {
                      BlocProvider.of<NotesCubit>(context).updateFav(1, (note.id)!);

                    } else {
                      BlocProvider.of<NotesCubit>(context).updateFav(0, (note.id)!);
                    }
                  },
                  child:   note.isaFavorite==0?
                  const Icon(Icons.favorite_border):
                 const Icon(Icons.favorite,color: Colors.red,),
                ),
               const SizedBox(width: 10),
                InkWell(
                  onTap:(){
                    Navigator.push(context,MaterialPageRoute(
                        builder: (context)=>EditNote(note: note)
                    ),
                    );

                  } ,
                  child: const Icon(Icons.edit,
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
                maxLines: 9,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSwipeActionRight() => Container(
        alignment: Alignment.centerRight,
        padding:const EdgeInsets.symmetric(horizontal: 20),
        color: Colors.red,
        child:const Icon(Icons.delete_forever, color: Colors.white, size: 32),
      );
}
