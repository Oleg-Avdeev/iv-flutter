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

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildTop(),
          SizedBox(height: 20),
          _buildPractice(),
        ],
      ),
    );
  }

  Widget _buildPractice() {
    int v = verb.getValue();

    if (v < Variables.RecognizeThreshold)
      return MemorizeWidget(verb: verb, onDone: onDone);
    if (v < Variables.TestThreshold)
      return RecognizeWidget(verb: verb, onDone: onDone);
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
          verb.getValue().toString() + '/' + Variables.DoneThreshold.toString(),
          style: CupertinoTheme.of(context).textTheme.navActionTextStyle,
        ),
        SizedBox(width: 10),
      ],
    );
  }
}
