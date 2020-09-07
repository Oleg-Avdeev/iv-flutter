import 'package:flutter/cupertino.dart';
import '../../verbs.dart';

class MemorizeWidget extends StatefulWidget {
  MemorizeWidget({Key key, this.verb, this.onDone}) : super(key: key);

  final Verb verb;
  final Function onDone;

  void increaseValue() {
    verb.increaseValue();
    onDone();
  }

  @override
  _MemorizeWidgetState createState() => _MemorizeWidgetState();
}

class _MemorizeWidgetState extends State<MemorizeWidget> {
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
      Text(
        widget.verb.getVerbs(),
        style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
      ),
      Text(
        widget.verb.translation,
        style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
      ),
      SizedBox(height: 20),
      CupertinoButton.filled(
        onPressed: widget.increaseValue,
        child: Text('Запомнила'),
      ),
    ];
  }
}
