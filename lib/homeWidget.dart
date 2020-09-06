import 'package:flutter/cupertino.dart';

class HomeWidget extends StatefulWidget {
  HomeWidget(
      {Key key, this.onPractice, this.onSettings, this.onLearn, this.onList})
      : super(key: key);

  final Function onPractice;
  final Function onSettings;
  final Function onLearn;
  final Function onList;

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _buildChildren(),
      ),
    );
  }

  List<Widget> _buildChildren() {
    return <Widget>[
      CupertinoButton.filled(
        onPressed: widget.onLearn,
        child: Text('Learn'),
      ),
      SizedBox(height: 20),
      CupertinoButton.filled(
        onPressed: widget.onPractice,
        child: Text('Practice'),
      ),
      SizedBox(height: 20),
      CupertinoButton.filled(
        onPressed: widget.onList,
        child: Text('List'),
      ),
      SizedBox(height: 20),
      CupertinoButton.filled(
        onPressed: widget.onSettings,
        child: Text('Settings'),
      ),
    ];
  }
}
