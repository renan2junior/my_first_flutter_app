import 'package:flutter/material.dart';
import 'package:flutter_app/models/dog.dart';
import 'package:flutter_app/widgets/image_listview.dart';

class DogDetail extends StatelessWidget {

  Dog _dog;

  DogDetail(this._dog);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_dog.raca),

      ),
      body: ImageListView(_dog.foto),
    );
  }
}

