import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:ivflutter/app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return CupertinoApp(
      title: 'iv — Learn Verbs!',
      theme: CupertinoThemeData(
        primaryColor: Color.fromARGB(255, 159, 137, 137),
      ),
      home: App(),
    );
  }
}
