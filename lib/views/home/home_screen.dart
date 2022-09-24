import 'package:flutter/material.dart';
import 'package:notes/views/widgets/listViewItem.dart';

class Home_screen extends StatefulWidget {
  @override
  _Home_screenState createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.transparent,
      title: Text("My Notes"),
        actions: [
          IconButton(icon:Icon(Icons.favorite,color: Colors.red,), onPressed: () {  }, ),
          IconButton(onPressed: (){}, icon: Icon(Icons.grid_view))

        ],
      ),

     body: Padding(
       padding: const EdgeInsets.all(15),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.end,
         children: [

           Text("swipe left to delete",style: TextStyle(color: Colors.red,fontSize: 10),),
           SizedBox(height: 15,),
          Expanded(child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (BuildContext context,int index){ return listViewItem();},
              separatorBuilder: (BuildContext context, int index) { return SizedBox(height: 20,); }, itemCount: 5),)

         ],
       ),
     ),
    );
  }
}
