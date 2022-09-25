import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/models/notes_model.dart';

class listViewItem extends StatelessWidget {
  NoteModel? note;
  listViewItem({required this.note});
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: buildSwipeActionRight(),
      key: Key("ih"),
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
                  note!.title!,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                InkWell(
                  onTap: (){},
                  child: Icon(Icons.favorite,
                    //size: 12,
                  ),
                ),
                SizedBox(width: 10),
                InkWell(
                  onTap:(){} ,
                  child: Icon(Icons.edit,
                    // size: 12,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: Text(
                note!.content!,
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
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: Colors.red,
        child: Icon(Icons.delete_forever, color: Colors.white, size: 32),
      );
}
