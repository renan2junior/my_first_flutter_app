import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/nav.dart';

class HelloPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Page 2"),
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Container(
      color: Colors.red,
      child: _button(context),
    );
  }

  _button(context) {
    return Center(
      child: RaisedButton(
        child: Text(
          "Voltar",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () => pop(context, params: "teste"),
      ),
    );
  }

}
