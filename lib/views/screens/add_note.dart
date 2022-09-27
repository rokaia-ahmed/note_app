import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/controller/home/cubit.dart';
import 'package:notes/controller/home/states.dart';
import 'package:notes/views/screens/home_screen.dart';

class AddNote extends StatelessWidget {
   AddNote({Key? key}) : super(key: key);
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlocConsumer<NotesCubit,NotesStates>(
      listener:(context,state){} ,
      builder:(context,state){
        NotesCubit cubit =BlocProvider.of(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                          flex: 4,
                          child: Text(
                            "Add Notes",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          )),
                      IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  const Text(
                    " Title",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          border:UnderlineInputBorder(
                            borderSide: BorderSide.none,
                            
                          ),
                        contentPadding: EdgeInsets.all(10)
                      ),
                      
                      controller: titleController,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  const Text(
                    " Content",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border:UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                          contentPadding: EdgeInsets.all(10)
                      ),
                      maxLines: 5,
                      controller: contentController,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Center(
                    child: SizedBox(
                      height: height*0.07,
                      width: width*0.9,
                      child: ElevatedButton(
                        onPressed: (){
                         cubit.insertToDb(
                          titleController.text,
                             contentController.text,
                             0,
                         );
                         Navigator.of(context).push( MaterialPageRoute<AddNote>(
                           builder: (BuildContext context) {
                             return  Home_screen();
                           },
                         ));
                        },
                        child: Text('Save', style: TextStyle(color: Colors.white, fontSize: 20),),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          shape: RoundedRectangleBorder(

                            borderRadius: BorderRadius.circular(12),
                            // <-- Radius
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      } ,
    );
  }
}
