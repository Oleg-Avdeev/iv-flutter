import 'package:flutter/cupertino.dart';
import '../../verbs.dart';

class RecognizeWidget extends StatefulWidget {
  RecognizeWidget({Key key, this.verb, this.onDone}) : super(key: key);

  final Verb verb;
  final Function onDone;

  @override
  _RecognizeWidgetState createState() => _RecognizeWidgetState();
}

class _RecognizeWidgetState extends State<RecognizeWidget> {
  bool flipped;

  void flip() {
    if (!flipped) {
      setState(() {
        flipped = true;
      });
    } else {
      widget.onDone();
      flipped = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildCard(),
          SizedBox(height: 20),
          CupertinoButton.filled(
            onPressed: flip,
            child: Text('Следующий'),
          ),
        ],
      ),
    );
  }

  Widget _buildCard() {
    if (!flipped) {
      return Text(
        widget.verb.translation,
        style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
      );
    } else {
      return Text(
        widget.verb.getVerbs(),
        style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
      );
    }
  }
}
