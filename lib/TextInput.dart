import 'package:flutter/material.dart';

class TextInputWidget extends StatefulWidget {
  final Function(String) callback;

  TextInputWidget(this.callback);

  @override
  _TextInputWidgetState createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final textEditingController = TextEditingController();

  // will wipe the current data from textEditingController
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    textEditingController.dispose();
  }

  void onClick() {
    widget.callback(textEditingController.text);
    textEditingController.clear();

    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: this.textEditingController,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.message,
        ),
        labelText: 'Type a message',
        suffixIcon: IconButton(
          onPressed: this.onClick,
          splashColor: Colors.amber[200],
          tooltip: 'Post Message',
          icon: Icon(
            Icons.send,
          ),
        ),
      ),
    );
  }
}
