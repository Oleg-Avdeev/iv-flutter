import 'package:flutter/cupertino.dart';
import '../../verbs.dart';

class MemorizeWidget extends StatefulWidget {
  MemorizeWidget({Key key, this.verb, this.onDone, this.topWidget})
      : super(key: key);

  final Verb verb;
  final Function onDone;
  final Function topWidget;

  void increaseValue() {
    onDone();
    verb.increaseValue();
  }

  @override
  _MemorizeWidgetState createState() => _MemorizeWidgetState();
}

class _MemorizeWidgetState extends State<MemorizeWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(height: 20),
        widget.topWidget(),
        Spacer(),
        Text(
          'Прочитайте вслух:',
          style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
        ),
        SizedBox(height: 20),
        Text(
          widget.verb.getVerbs(),
          style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
        ),
        Text(
          widget.verb.translation,
          style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
        ),
        Spacer(),
        CupertinoButton.filled(
          onPressed: widget.increaseValue,
          child: Text('Запомнила'),
        ),
        SizedBox(height: 20),
      ]),
    );
  }
}
