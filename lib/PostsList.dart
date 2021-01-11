import 'package:flutter/material.dart';
import 'package:flutter_sample_app/post.dart';

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
