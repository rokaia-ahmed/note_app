
import 'package:flutter/material.dart';

class ShowloadingIndicator extends StatelessWidget {
  const ShowloadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  Center(
        child: Container(
          //color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              CircularProgressIndicator(
              color: Colors.purple,
            ),
              Text('Loading ....',style: TextStyle(color: Colors.white,fontSize: 17),),
            ],
          ),
        ),
    );
  }
}
