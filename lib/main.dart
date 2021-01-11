import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fluuter Blog',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.deepOrange,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomepage(),
    );
  }
}

class MyHomepage extends StatefulWidget {
  @override
  _MyHomepageState createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  String text = '';

  void changedText(String text) {
    this.setState(() {
      this.text = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Blog'),
      ),
      body: Column(
        children: [
          TextInputWidget(this.changedText),
          Text(this.text),
        ],
      ),
    );
  }
}

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
