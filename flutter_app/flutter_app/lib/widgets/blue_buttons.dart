
import 'package:flutter/material.dart';

class BlueButtons extends StatelessWidget {

  String text;
  Function onPressed;
  Color color;

  BlueButtons(this.text, {@required this.onPressed, this.color = Colors.green });

  @override
  Widget build(BuildContext context) {
    return _button();
  }

  Widget _button() {
    return RaisedButton(
      color: color,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      onPressed: () => onPressed(),
    );
  }
}
