import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// standard class Post
class Post {
  String body;
  String author;
  int likes = 0;
  bool userLiked = false;

  Post(this.body, this.author);

  void likePost() {
    this.userLiked = !this.userLiked;

    if (this.userLiked) {
      this.likes += 1;
    } else {
      this.likes -= 1;
    }
  }
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
  List<Post> posts = [];

  void newPost(String text) {
    this.setState(() {
      posts.add(new Post(text, 'irfan'));
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

class PostsList extends StatefulWidget {
  final List<Post> listItems;

  PostsList(this.listItems);

  @override
  _PostsListState createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  void like(Function callback) {
    this.setState(() {
      callback();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.widget.listItems.length,
      itemBuilder: (BuildContext context, int index) {
        var post = this.widget.listItems[index];

        return Card(
          child: Row(
            children: [
              Expanded(
                child: ListTile(
                  title: Text(post.body),
                  subtitle: Text(post.author),
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Text(
                      post.likes.toString(),
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.thumb_up),
                    onPressed: () => like(post.likePost),
                    color: post.userLiked ? Colors.green : Colors.red,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
