import 'package:flutter/material.dart';

Future push(BuildContext context, Widget page) {
  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
    return page;
  }));
}

pop(BuildContext context, {params}) {
  print("Enviando >>> $params");
  Navigator.pop(context, params);
}
