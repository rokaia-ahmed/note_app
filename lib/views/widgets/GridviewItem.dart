import 'package:flutter/material.dart';

import 'listViewItem.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          children: List.generate(10,
               (index){
               return SizedBox();
                 //listViewItem();
                  }
          ),
        ),
      ),
    );
  }
}
