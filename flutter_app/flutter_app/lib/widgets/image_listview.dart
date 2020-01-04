import 'package:flutter/material.dart';

class ImageListView extends StatelessWidget {
  String image_name;

  ImageListView(this.image_name);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        "assets/images/$image_name",
        fit: BoxFit.cover,
      ),
    );
  }
}
