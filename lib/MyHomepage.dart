import 'package:flutter/material.dart';
import 'package:flutter_sample_app/PostsList.dart';
import 'package:flutter_sample_app/TextInput.dart';
import 'package:flutter_sample_app/post.dart';

class MyHomepage extends StatefulWidget {
  final String name;

  MyHomepage(this.name);

  @override
  _MyHomepageState createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  List<Post> posts = [];

  void newPost(String text) {
    this.setState(() {
      posts.add(new Post(
        text,
        widget.name,
      ));
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
          Expanded(child: PostsList(this.posts)),
          TextInputWidget(this.newPost),
        ],
      ),
    );
  }
}
