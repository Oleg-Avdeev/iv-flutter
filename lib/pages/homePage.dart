import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  HomePage(
      {Key key, this.onPractice, this.onSettings, this.onLearn, this.onList})
      : super(key: key);

  final Function onPractice;
  final Function onSettings;
  final Function onLearn;
  final Function onList;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
