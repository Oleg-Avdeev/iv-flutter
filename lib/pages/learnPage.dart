import 'package:flutter/cupertino.dart';
import '../verbs.dart';

class LearnPage extends StatefulWidget {
  LearnPage(
      {Key key,
      this.verb,
      this.onPressed,
      this.onBack,
      this.learnIndex,
      this.learnLength})
      : super(key: key);

  final Verb verb;
  final Function onPressed;
  final Function onBack;
  final int learnIndex;
  final int learnLength;

  @override
  _LearnPageState createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _buildChildren(),
      ),
    );
  }

  List<Widget> _buildChildren() {
    if (widget.verb != null) {
      return <Widget>[
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _buildTop(),
        ),
        Spacer(),
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
          onPressed: widget.onPressed,
          child: Text('Следующий'),
        ),
        SizedBox(height: 20),
      ];
    } else {
      return <Widget>[
        Text(
          '...',
          style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
        ),
        Text(
          '...',
          style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
        ),
      ];
    }
  }

  List<Widget> _buildTop() {
    return <Widget>[
      SizedBox(
        width: 100,
        child: Center(
          child: CupertinoButton(
            onPressed: widget.onBack,
            child: Icon(CupertinoIcons.home),
          ),
        ),
      ),
      Text(
        "Запоминайте слова",
        style: CupertinoTheme.of(context).textTheme.navActionTextStyle,
      ),
      SizedBox(
        width: 100,
        child: Center(
          child: Text(
            widget.learnIndex.toString() + '/' + widget.learnLength.toString(),
            style: CupertinoTheme.of(context).textTheme.navActionTextStyle,
          ),
        ),
      ),
    ];
  }
}
