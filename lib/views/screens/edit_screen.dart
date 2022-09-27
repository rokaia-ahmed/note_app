import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/controller/home/cubit.dart';
import 'package:notes/controller/home/states.dart';
import 'package:notes/models/notes_model.dart';


class EditNote extends StatefulWidget {
  NoteModel note;
  EditNote({Key? key,required this.note}) : super(key: key);

  @override
  _EditNoteState createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  TextEditingController? titleController,contentController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleController= new TextEditingController(text: widget.note.title);
    contentController=new TextEditingController(text: widget.note.content);
  }
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
                     const Expanded(
                          flex: 4,
                          child: Text(
                            "Edit Notes",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          )),
                      IconButton(
                        icon:const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                          onPressed: () {},
                          icon:const Icon(
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
                      decoration:const InputDecoration(
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
                      decoration:const InputDecoration(
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
                      height: height*0.1,
                      width: width*0.9,
                      child: ElevatedButton(
                        onPressed: (){
                          cubit.updateContent(
                            //titleController.text,
                              contentController!.text,
                              widget.note.id!

                          );
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.black,
                          shape: RoundedRectangleBorder(

                            borderRadius: BorderRadius.circular(12),
                            // <-- Radius
                          ),
                        ),
                        child:const Text('Save',
                          style: TextStyle(color: Colors.black, fontSize: 20),
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