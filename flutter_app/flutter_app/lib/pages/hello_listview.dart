import 'package:flutter/material.dart';
import 'package:flutter_app/models/dog.dart';
import 'package:flutter_app/pages/dog_detail.dart';
import 'package:flutter_app/utils/nav.dart';
import 'package:flutter_app/widgets/image_listview.dart';

class HelloListView extends StatefulWidget {
  @override
  _HelloListViewState createState() => _HelloListViewState();
}

class _HelloListViewState extends State<HelloListView> {
  bool _gridView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.list),
              onPressed: () {
                print("list");
                setState(() {
                  _gridView = false;
                });
              }),
          IconButton(
              icon: Icon(Icons.grid_on),
              onPressed: () {
                print("list");
                setState(() {
                  _gridView = true;
                });
              })
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      color: Colors.green,
      child: _Images(),
    );
  }

  _Images() {
    List<Dog> dogs = [
      Dog("Jack Russel", "dog1.png"),
      Dog("Labrador", "dog2.png"),
      Dog("Pug", "dog3.png"),
      Dog("Rottweiler", "dog4.png"),
      Dog("Pastor", "dog5.png"),
    ];

    if (_gridView) {
      return GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: dogs.length,
          itemBuilder: (context, index) {
            Dog dog = dogs[index];
            return _boxDog(context, dog);
          });
    }
    return ListView.builder(
        itemCount: dogs.length,
        itemExtent: 350 ,
        itemBuilder: (context, index) {
          Dog dog = dogs[index];
          return _boxDog(context, dog);
        });
  }

  _boxDog(context, dog) {
    var mediaQuery = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => push(context, DogDetail(dog)),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          ImageListView(dog.foto),
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.all(8),
                width: mediaQuery.width,
                decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(50)),
                child: Text(
                  dog.raca,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.amberAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
