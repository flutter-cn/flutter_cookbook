import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Avoid Overflow Error'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
          child: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Column Overflow'),
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ColumnOverflow())),
          ),
          ListTile(
            title: Text('Aoivd Column Overflow'),
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AvoidColumnOverflow())),
          ),
          ListTile(
            title: Text('Row Overflow'),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => RowOverflow())),
          ),
          ListTile(
            title: Text('Avoid Row Overflow'),
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AvoidRowOverflow())),
          ),
        ],
      )),
    );
  }
}

class RowOverflow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Row Overflow'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 8.0, right: 20.0),
              child: Icon(Icons.account_balance),
            ),
            Text(
                'Main Cotent. This is a demo to show how to avoid overflow in a Row widget'),
          ],
        ),
      ),
    );
  }
}

class AvoidRowOverflow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avoid Row Overflow'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 8.0, right: 20.0),
              child: Icon(Icons.account_balance),
            ),
            Expanded(
              child: Text(
                  'Main Cotent. This is a demo to show how to avoid overflow in a Row widget'),
            ),
          ],
        ),
      ),
    );
  }
}

class ColumnOverflow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avoid Column Overflow'),
      ),
      body: Column(
        children: <Widget>[
          _oneRow(),
          _oneRow(),
          _oneRow(),
          _oneRow(),
          _oneRow(),
        ],
      ),
    );
  }

  Widget _oneRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 50.0),
      child: Text('Hello World'),
    );
  }
}

class AvoidColumnOverflow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avoid Column Overflow'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _oneRow(),
            _oneRow(),
            _oneRow(),
            _oneRow(),
            _oneRow(),
          ],
        ),
      ),
    );
  }

  Widget _oneRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 50.0),
      child: Text('Hello World'),
    );
  }
}
