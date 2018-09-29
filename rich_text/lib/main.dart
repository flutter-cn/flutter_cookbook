import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RichText')),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Center(child: RichTextWidget(),),
      ),
    );
  }

}

class RichTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'This is ',
        style: TextStyle(color: Colors.black, fontSize: 18.0),
        children: <TextSpan>[
          TextSpan(
            text: 'bold ',
            style: TextStyle(fontWeight: FontWeight.bold, )
          ),
          TextSpan(
              text: 'text. '
          ),
          TextSpan(
              text: 'This is ',),
          TextSpan(
              text: 'larger ',
              style:
              TextStyle(fontSize: 22.0)),
          TextSpan(
              text: 'font size.',),
          TextSpan(
            text: 'This is ',),
          TextSpan(
              text: 'red ',
              style:
              TextStyle(color: Colors.red)),
          TextSpan(
            text: 'color.',),
        ],
      ),
    );
  }

}