import 'package:flutter/material.dart';
import 'package:flutter_app/pages/hello_listview.dart';
import 'package:flutter_app/pages/hello_page2.dart';
import 'package:flutter_app/pages/hello_page3.dart';
import 'package:flutter_app/utils/nav.dart';
import 'package:flutter_app/widgets/blue_buttons.dart';
import 'package:flutter_app/widgets/drawer_list.dart';
import 'package:flutter_app/widgets/image_listview.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Suplementos e saúde"),
          bottom: TabBar(tabs: <Widget>[
            Tab(text: "TAB1"),
            Tab(text: "TAB2"),
            Tab(text: "TAB3"),
          ],),
        ),
        body: TabBarView(
          children: <Widget>[
            _body(context),
            _body(context),
            Container(
              color: Colors.yellow,
            )
          ],
        ) ,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => print("FLoat"),
        ),
        drawer: DrawerList(),
      ),
    );
  }

  _body(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _text(),
          Container(
            height: 300,
            child: _pageView(),
          ),
          _buttons(),
        ],
      ),
    );
  }

  _pageView() {
    return Container(
      height: 300,
      child: PageView(
        children: <Widget>[
          ImageListView("dog1.png"),
          ImageListView("dog2.png"),
          ImageListView("dog3.png"),
          ImageListView("dog4.png"),
          ImageListView("dog5.png"),
          _imgNetwork()
        ],
      ),
    );
  }

  _buttons() {
    return Builder(builder: (BuildContext context) {
      return Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              BlueButtons("ListView",
                  onPressed: () => _onClickNavigator(context, HelloListView())),
              BlueButtons("Page 2",
                  onPressed: () => _onClickNavigator(context, HelloPage2())),
              BlueButtons("Page 3",
                  onPressed: () => _onClickNavigator(context, HelloPage3()))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              BlueButtons(
                "Snack",
                onPressed: () => _onclickSnack(context),
                color: Colors.red,
              ),
              BlueButtons("Dialog", onPressed: () => _onclickDialog(context)),
              BlueButtons("Toast", onPressed: _onClickToast)
            ],
          )
        ],
      );
    });
  }

  _onclickSnack(context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("ola!"),
      action: SnackBarAction(
        label: "OK",
        textColor: Colors.yellow,
        onPressed: () => print("OK"),
      ),
    ));
  }

  _onclickDialog(context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text("Flutter é muito legal."),
          actions: <Widget>[
            FlatButton(
              child: Text("Cancelar"),
              onPressed: () {
                print("Cancelar");
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text("OK"),
              onPressed: () => print("OK"),
            ),
          ],
        );
      },
    );
  }

  _onClickToast() {
    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );

  }

  void _onClickNavigator(BuildContext context, Widget page) async {
    print("Clikei");
    String s = await push(context, page);
    print(">>> $s");
  }

  _imgNetwork() {
    return Image.network(
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQAxoE7wJyV6Ct3z1F3RML5qzyHO0LEkvUUc4WEZKFF_Pl27mcHA&s",
    );
  }

  Text _text() {
    return Text(
      "Ola!",
      style: TextStyle(
        fontSize: 40,
        color: Colors.blue,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
