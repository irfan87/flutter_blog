import 'package:flutter/material.dart';
import 'package:flutter_sample_app/MyHomepage.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String name;
  TextEditingController textEditingController = TextEditingController();

  void onClick() {
    this.name = textEditingController.text;

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MyHomepage(this.name)));
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: TextField(
          controller: textEditingController,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.person,
            ),
            labelText: 'Type your name',
            border: OutlineInputBorder(
              borderSide: BorderSide(
                width: 5,
                color: Colors.black,
              ),
            ),
            suffixIcon: IconButton(
              onPressed: onClick,
              splashColor: Colors.amber[200],
              tooltip: 'Submit',
              icon: Icon(
                Icons.done,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
