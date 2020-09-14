import 'package:flutter/cupertino.dart';
import '../../verbs.dart';

class TestWidget extends StatefulWidget {
  TestWidget({Key key, this.verb, this.onDone, this.topWidget})
      : super(key: key);

  final Verb verb;
  final Function onDone;
  final Function topWidget;

  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  bool flipped = false;
  String i = '', ii = '', iii = '';
  bool c1 = false, c2 = false, c3 = false;

  TextStyle okStyle = TextStyle(color: Color.fromARGB(255, 0, 0, 0));
  TextStyle wrongStyle = TextStyle(color: Color.fromARGB(255, 185, 50, 50));

  void flip() {
    if (!flipped) {
      setState(() {
        flipped = true;
        c1 = compare(i, widget.verb.i);
        c2 = compare(ii, widget.verb.ii);
        c3 = compare(iii, widget.verb.iii);
      });
    } else {
      if (c1 && c2 && c3) widget.verb.increaseValue();
      i = ii = iii = '';
      widget.onDone();
      flipped = false;
    }
  }

  bool compare(String attempt, String ideal) {
    if (ideal == '—') {
      return (attempt == null ||
          attempt == '-' ||
          attempt == '' ||
          attempt == ' ' ||
          attempt == '—' ||
          attempt == '–');
    } else {
      attempt = attempt.toLowerCase().trim();
      var alt = ideal.split('/');

      if (attempt == ideal) return true;
      if (alt.length <= 1) return false;
      if (attempt == alt[0]) return true;
      if (attempt == alt[1]) return true;

      return false;
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
            !flipped ? 'Переведите:' : '',
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
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 20),
              Expanded(
                child: CupertinoTextField(
                  placeholder: "-",
                  textAlign: TextAlign.center,
                  onChanged: (value) => i = value,
                  style: TextStyle(
                    fontSize: 15,
                    height: 2.5,
                  ),
                ),
              ),
              SizedBox(width: 20, child: Center(child: Text('|'))),
              Expanded(
                child: CupertinoTextField(
                  placeholder: "-",
                  textAlign: TextAlign.center,
                  onChanged: (value) => ii = value,
                  style: TextStyle(
                    fontSize: 15,
                    height: 2.5,
                  ),
                ),
              ),
              SizedBox(width: 20, child: Center(child: Text('|'))),
              Expanded(
                child: CupertinoTextField(
                  placeholder: "-",
                  textAlign: TextAlign.center,
                  onChanged: (value) => iii = value,
                  style: TextStyle(
                    fontSize: 15,
                    height: 2.5,
                  ),
                ),
              ),
              SizedBox(width: 20),
            ],
          ),
          SizedBox(height: 10),
          Text(
            widget.verb.translation,
            style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
          ),
        ],
      );
    } else {
      return RichText(
        text: new TextSpan(
          style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
          children: [
            new TextSpan(text: widget.verb.i, style: c1 ? okStyle : wrongStyle),
            new TextSpan(text: ' | '),
            new TextSpan(
                text: widget.verb.ii, style: c2 ? okStyle : wrongStyle),
            new TextSpan(text: ' | '),
            new TextSpan(
                text: widget.verb.iii, style: c3 ? okStyle : wrongStyle),
          ],
        ),
      );
      // return Text(
      //   widget.verb.getVerbs(),
      //   style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
      // );
    }
  }
}
