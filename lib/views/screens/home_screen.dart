import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/controller/home/cubit.dart';
import 'package:notes/controller/home/states.dart';
import 'package:notes/models/db_config.dart';
import 'package:notes/models/notes_model.dart';
import 'package:notes/shared/app_colors.dart';
import 'package:notes/views/widgets/listViewItem.dart';
import 'package:notes/views/widgets/show_indicator.dart';
import '../widgets/GridviewItem.dart';
import 'add_note.dart';
import 'favourite_screen.dart';

class Home_screen extends StatefulWidget {
  @override
  _Home_screenState createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  List<NoteModel>? allNotes;
  bool isListView = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<NotesCubit>(context).getAllTask();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("My Notes"),
        actions: [
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            onPressed: () {

              Navigator.push(context, MaterialPageRoute(builder: (v) {
                return Faviourte_screen();
              }));
            },
          ),
          IconButton(
              onPressed: () {
                setState(() {
                  isListView = !isListView;
                });
                /*Navigator.push(context,MaterialPageRoute(
                        builder: (context)=>GridViewItem()
                    ),
                    );*/
              },
              icon: Icon(Icons.grid_view)),
        ],
      ),
      body: buildBody(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: lightGreen,
        child: Icon(Icons.add_outlined),
        onPressed: () {
          print('tuyrtytwe');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddNote(),
            ),
          );
        },
      ),
    );
  }

  Widget buildBody() {
    return BlocBuilder<NotesCubit, NotesStates>(builder: (context, state) {
      if (state is NotesgetDbLoadingState) {
        allNotes = (state).allNotes;
        print('notew $allNotes');
        return Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "swipe left to delete",
                style: TextStyle(color: Colors.red, fontSize: 10),
              ),
              SizedBox(
                height: 15,
              ),
              isListView
                  ? Expanded(
                      child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: allNotes!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return listViewItem(
                          note: allNotes![index],
                        );
                      },
                      //separatorBuilder: (BuildContext context, int index) { return SizedBox(height: 20,); }, itemCount: 5),
                    ))
                  : Expanded(
                      child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                        crossAxisSpacing: 0.5,
                        mainAxisSpacing: 0.5,
                      ),
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: allNotes!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return listViewItem(note: allNotes![index]);
                      },
                    ))
            ],
          ),
        );
      } else {
        return ShowloadingIndicator();
      }
    });
  }
}
