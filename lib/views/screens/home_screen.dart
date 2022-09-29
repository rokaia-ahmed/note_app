import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/controller/home/cubit.dart';
import 'package:notes/controller/home/states.dart';
import 'package:notes/models/notes_model.dart';
import 'package:notes/shared/app_colors.dart';
import 'package:notes/views/widgets/listViewItem.dart';
import 'add_note.dart';
import 'favourite_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        title:const Text("My Notes"),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            onPressed: () {

              Navigator.push(context, MaterialPageRoute(builder: (v) {
                return const FavouriteScreen();
              }));
            },
          ),
          IconButton(
              onPressed: () {
                if(isListView){context.read<NotesCubit>().showNotesInListEvent();}
                else{context.read<NotesCubit>().showNotesInGridEvent();}
              },
              icon:const Icon(Icons.grid_view)
          ),
        ],
      ),
      body: buildBody(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: lightGreen,
        child:const Icon(Icons.add_outlined),
        onPressed: () {
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
        return buildListItems();
      }
      else if(state is ShowNotesInViewState)
      {
        isListView=state.inList;
        return buildListItems();
      }
      else {
        return Center(
          child:Image.asset('assets/images/Frame.png',
          height:180 ,
            width: 180,
        ) ,);
      }
    });
  }
  Widget buildListItems(){
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children:  [
          const Text(
            "swipe left to delete",
            style: TextStyle(color: Colors.red, fontSize: 10),
          ),
          const SizedBox(height: 15,),
          _buildListOrEmpty()
        ],
      ),
    );
  }
  Widget _buildListOrEmpty( ) {

    return isListView ?   _buildNotesListView():_buildNotesGridView();

  }
  _buildNotesGridView() {
    return Expanded(
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
            return ListViewItem(note: allNotes![index]);
          },
        ));
  }
  _buildNotesListView() {
    return Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: allNotes!.length,
          itemBuilder: (BuildContext context, int index) {
            return ListViewItem(
              note: allNotes![index],
            );
          },
        ));
  }

}