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
        primaryColor: Color.fromARGB(255, 119, 197, 207),
      ),
      home: App(),
    );
  }
}
