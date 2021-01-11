import 'package:flutter/material.dart';
import 'package:flutter_sample_app/Body.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Blog'),
      ),
      body: Body(),
    );
  }
}
