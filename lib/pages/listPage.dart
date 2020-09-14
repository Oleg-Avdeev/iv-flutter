import 'package:ivflutter/variables.dart' as Variables;
import 'package:flutter/cupertino.dart';
import '../verbs.dart';

class ListPage extends StatefulWidget {
  ListPage({Key key, this.onBack, this.verbs, this.index}) : super(key: key);

  final Function onBack;
  final List<Verb> verbs;
  final int index;

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: CupertinoButton.filled(
              onPressed: widget.onBack,
              child: Icon(CupertinoIcons.home),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: _buildChildren(),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _buildChildren() {
    List<Widget> children = new List<Widget>();
    int index = 0;

    for (var verb in widget.verbs) {
      children.add(_buildItem(verb, index < widget.index));
      children.add(new SizedBox(height: 10));
      index++;
    }
    return children;
  }

  Widget _buildItem(Verb verb, bool done) {
    return Container(
      // color: CupertinoColors,
      child: Row(children: [
        SizedBox(width: 5),
        Icon(
          !done
              ? CupertinoIcons.circle
              : CupertinoIcons.check_mark_circled_solid,
          size: 30,
        ),
        SizedBox(width: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              verb.getVerbs(),
              textScaleFactor: 0.5,
              style:
                  CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
            ),
            Text(verb.translation),
          ],
        ),
        Spacer(),
        Text(verb.getValue().toString() +
            '/' +
            Variables.DoneThreshold.toString()),
      ]),
    );
  }
}
