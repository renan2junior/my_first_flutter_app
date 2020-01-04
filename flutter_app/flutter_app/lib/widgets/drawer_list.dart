import 'package:flutter/material.dart';
import 'package:flutter_app/pages/hello_listview.dart';
import 'package:flutter_app/utils/nav.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Renan Junior"),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("Info"),
              subtitle: Text("Informcaoes"),
              onTap: () => push(context, HelloListView()),
            )
          ],
        ),
      ),
    );
  }
}
