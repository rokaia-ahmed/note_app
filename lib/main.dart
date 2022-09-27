import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/views/screens/home_screen.dart';

import 'controller/home/cubit.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>NotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter ss',
        theme: ThemeData(
          backgroundColor: Colors.black,
          primarySwatch: Colors.blue,
        ),
        home:const HomeScreen(),
      ),
    );
  }
}

