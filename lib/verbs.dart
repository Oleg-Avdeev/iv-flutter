import 'package:shared_preferences/shared_preferences.dart';

class Verb {
  Verb({this.i, this.ii, this.iii, this.translation});

  final String i;
  final String ii;
  final String iii;
  final String translation;

  int value = 0;

  String getVerbs() {
    return '$i | $ii | $iii';
  }

  void loadValue() {
    SharedPreferences.getInstance().then((prefs) => {value = prefs.getInt(i)});
  }

  void increaseValue() {
    value = value + 1;
    SharedPreferences.getInstance().then((prefs) => {prefs.setInt(i, value)});
  }
}
