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
}
