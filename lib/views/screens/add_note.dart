import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/controller/home/cubit.dart';
import 'package:notes/controller/home/states.dart';
import 'package:notes/views/screens/home_screen.dart';



class AddNote extends StatelessWidget {
  AddNote({Key? key}) : super(key: key);
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlocConsumer<NotesCubit, NotesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        NotesCubit cubit = BlocProvider.of(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children:const [
                        Expanded(
                            flex: 4,
                            child: Text(
                              "Add Notes",
                              style: TextStyle(color: Colors.white, fontSize: 25),
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
                          border: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
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
                        validator: (value){
                          if(value!.isEmpty){
                            return 'enter the content';
                          }
                          return null;
                        },
                        decoration:const InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
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
                        height: height * 0.1,
                        width: width * 0.9,
                        child: ElevatedButton(
                          onPressed: () {
                            if(formKey.currentState!.validate()){
                              cubit.insertToDb(
                                titleController.text,
                                contentController.text,
                                0,
                              ).then((value){
                                Navigator.push(context,MaterialPageRoute(
                                  builder:(context)=> const HomeScreen(),
                                ),
                                );
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            onPrimary: Colors.black,
                            primary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              // <-- Radius
                            ),
                          ),
                          child: const Text(
                            'Save',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
