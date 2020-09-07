import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:ivflutter/pages/practice/memorizeWidget.dart';
import 'package:ivflutter/pages/practice/recognizeWidget.dart';
import 'package:ivflutter/pages/practice/testWidget.dart';
import '../verbs.dart';

class PracticePage extends StatefulWidget {
  PracticePage({Key key, this.verbs, this.onBack, this.maxIndex})
      : super(key: key);

  final List<Verb> verbs;
  final Function onBack;
  final int maxIndex;

  @override
  _PracticePageState createState() => _PracticePageState();
}

class _PracticePageState extends State<PracticePage> {
  int index;

  void onDone() {
    setState(() {
      index = Random().nextInt(widget.maxIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          _buildTop(),
          _buildPractice(),
        ],
      ),
    );
  }

  Widget _buildPractice() {
    var verb = widget.verbs[index];
    int v = verb.value;

    if (v < 5) return MemorizeWidget(verb: verb, onDone: onDone);
    if (v < 10) return RecognizeWidget(verb: verb, onDone: onDone);
    return TestWidget(verb: verb, onDone: onDone);
  }

  Widget _buildTop() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(width: 10),
        CupertinoButton.filled(
          onPressed: widget.onBack,
          child: Icon(CupertinoIcons.home),
        ),
        SizedBox(width: 10),
        Text(
          'x/x',
          style: CupertinoTheme.of(context).textTheme.navActionTextStyle,
        ),
        SizedBox(width: 10),
      ],
    );
  }
}
