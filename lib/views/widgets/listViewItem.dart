import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class listViewItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: buildSwipeActionRight(),
      key: Key("ih"),
      child: Container(
        // margin: EdgeInsets.all(10),
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
                  "Note Title",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
                IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
              ],
            ),
            Expanded(
              child: Text(
                " bhjbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb",
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
