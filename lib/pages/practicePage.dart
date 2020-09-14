import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:ivflutter/variables.dart' as Variables;
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
  int index = -1;
  Verb verb;

  void onDone() {
    setState(() {
      index = Random().nextInt(widget.maxIndex);
      verb = widget.verbs[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    if (verb == null || index < 0) {
      index = Random().nextInt(widget.maxIndex);
      verb = widget.verbs[index];
    }

    return CupertinoPageScaffold(
      child: _buildPractice(),
    );
  }

  Widget _buildPractice() {
    int v = verb.getValue();

    if (v < Variables.RecognizeThreshold)
      return MemorizeWidget(verb: verb, onDone: onDone, topWidget: _buildTop);
    if (v < Variables.TestThreshold)
      return RecognizeWidget(verb: verb, onDone: onDone, topWidget: _buildTop);
    return TestWidget(verb: verb, onDone: onDone, topWidget: _buildTop);
  }

  Widget _buildTop() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
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
          "Повторение глаголов",
          style: CupertinoTheme.of(context).textTheme.navActionTextStyle,
        ),
        SizedBox(
          width: 100,
          child: Center(
            child: Text(
              verb.getValue().toString() +
                  '/' +
                  Variables.DoneThreshold.toString(),
              style: CupertinoTheme.of(context).textTheme.navActionTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}
