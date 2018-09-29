import 'package:flutter/material.dart';

import 'package:stateful_communication/global_key_communication.dart';
import 'package:stateful_communication/value_notifier_communication.dart';

void main() {
  runApp(MyApp());
}

final key = GlobalKey<MyStatefulWidgetOneState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("StatefulWidget Communication"),
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
            title: Text('Global Key Communication'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => GlobalKeyCommunication()),
            )),
        ListTile(
            title: Text('Value Notifier Communication'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ValueNotifierCommunication()),
            ))
      ],
    );
  }

}
