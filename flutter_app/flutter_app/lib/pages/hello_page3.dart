import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelloPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Page 3"),
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
        onPressed: () => _voltar(context),
      ),
    );
  }

  _voltar(context) {
    Navigator.pop(context, "Teste de retorno!");
  }
}
