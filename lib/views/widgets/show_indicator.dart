
import 'package:flutter/material.dart';

class ShowloadingIndicator extends StatelessWidget {
  const ShowloadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return const Center(
        child: CircularProgressIndicator(
        color: Colors.purple,
    ),
    );
  }
}
