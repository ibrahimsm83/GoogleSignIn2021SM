import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text( "Google Sign Successfull"),
      ),
      body: Container(color: Colors.blue[100]),
    );
  }
}