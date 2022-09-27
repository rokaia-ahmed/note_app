import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/home/cubit.dart';
import '../../controller/home/states.dart';
import '../../models/notes_model.dart';
import '../../shared/app_colors.dart';
import '../widgets/listViewItem.dart';
import 'add_note.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<NoteModel>? FavTasks;
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
        title:const Text("My Favourites"),
        actions: [
          IconButton(
            icon:const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            onPressed: () {},
          ),
          IconButton(
              onPressed: () {
                setState(() {
                  isListView = !isListView;
                });
              },
              icon:const Icon(Icons.grid_view)),
        ],
      ),
      body: buildBody(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: lightGreen,
        child:const Icon(Icons.add_outlined),
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
        FavTasks = (state).favtasks;
        print('notew $FavTasks');
        return Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                "swipe left to delete",
                style: TextStyle(color: Colors.red, fontSize: 10),
              ),
              const SizedBox(
                height: 15,
              ),
              isListView
                  ? Expanded(
                      child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: FavTasks!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListViewItem(
                          note: FavTasks![index],
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
                      physics:const ClampingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: FavTasks!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListViewItem(note: FavTasks![index]);
                      },
                    ))
            ],
          ),
        );
      } else {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children:const [
              Icon(Icons.favorite,
              size: 150,
                color: Colors.red,
              ),
              Text('add favorite note',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              ),
            ],
          ),
        );
      }
    });
  }
}
