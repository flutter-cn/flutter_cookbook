import 'package:flutter/material.dart';

class ValueNotifierData extends ValueNotifier<String> {
  ValueNotifierData(value) : super(value);
}

class ValueNotifierCommunication extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ValueNotifierData vd = ValueNotifierData('Hello World');
    return Scaffold(
      appBar: AppBar(title: Text('Value Notifier Communication'),),
      body: _WidgetOne(data: vd),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.refresh),onPressed: () {
        vd.value = 'Yes';
      }),
    );
  }
}

class _WidgetOne extends StatefulWidget {
  _WidgetOne({this.data});
  final ValueNotifierData data;
  @override
  _WidgetOneState createState() => _WidgetOneState();
}

class _WidgetOneState extends State<_WidgetOne> {

  String info;

  @override
  initState() {
    super.initState();
    widget.data.addListener(_handleValueChanged);
    info = 'Initial mesage: ' + widget.data.value;
  }
  @override
  dispose() {
    widget.data.removeListener(_handleValueChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(info),);
  }

  void _handleValueChanged() {
    setState(() {
      info = 'Message changed to: ' + widget.data.value;
    });
  }
}
