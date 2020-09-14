import 'package:flutter/cupertino.dart';
import '../../verbs.dart';

class RecognizeWidget extends StatefulWidget {
  RecognizeWidget({Key key, this.verb, this.onDone, this.topWidget})
      : super(key: key);

  final Verb verb;
  final Function onDone;
  final Function topWidget;

  @override
  _RecognizeWidgetState createState() => _RecognizeWidgetState();
}

class _RecognizeWidgetState extends State<RecognizeWidget> {
  bool flipped = false;

  void flip() {
    if (!flipped) {
      setState(() {
        flipped = true;
      });
    } else {
      widget.verb.increaseValue();
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
          SizedBox(height: 20),
          widget.topWidget(),
          Spacer(),
          Text(
            !flipped ? 'Переведите вслух:' : '',
            style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
          ),
          SizedBox(height: 20),
          _buildCard(),
          Spacer(),
          CupertinoButton.filled(
            onPressed: flip,
            child: Text(flipped ? 'Следующий' : 'Проверить'),
          ),
          SizedBox(height: 20),
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
