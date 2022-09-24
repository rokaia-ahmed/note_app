import 'package:flutter/material.dart';

class AddNote extends StatelessWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.black,
      body: Padding(
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
                      "Edit Notes",
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
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    )),
              ],
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Text(
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
              child: TextFormField(),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Text(
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
                maxLines: 5,
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

                  onPressed: () {},
                  child: Text('Save', style: TextStyle(color: Colors.black, fontSize: 20),),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
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
    );
  }
}
