import 'package:shared_preferences/shared_preferences.dart';

class Verb {
  Verb({this.i, this.ii, this.iii, this.translation});

  final String i;
  final String ii;
  final String iii;
  final String translation;

  int _value = 0;

  String getVerbs() {
    return '$i | $ii | $iii';
  }

  void loadValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _value = prefs.getInt(i);
    if (_value == null) {
      _value = 0;
    }
  }

  void increaseValue() async {
    _value = _value + 1;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(i, _value);
  }

  int getValue() {
    if (_value == null) return 0;
    return _value;
  }
}
