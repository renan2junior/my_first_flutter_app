import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelloPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Page 1"),

      ),
      body: Container(
        color: Colors.red,
      ),
    );
  }
}
