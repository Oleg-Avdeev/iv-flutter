import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:ivflutter/homeWidget.dart';
import 'package:ivflutter/listWidget.dart';
import 'learnWidget.dart';
import 'verbs.dart';

enum Navigation {
  home,
  list,
  learn,
  practice,
  settings,
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  Navigation _navigation = Navigation.home;
  List<Verb> _verbs;

  int _globalIndex = 0;
  int _learnIndex = 0;
  int _learnCount = 5;

  @override
  void initState() {
    super.initState();
    _verbs = new List<Verb>();
    loadAsset().then((value) => setState(() {
          handleTSV(value, _verbs);
        }));
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: _navigate(),
    );
  }

  Widget _navigate() {
    if (_navigation == Navigation.home) {
      return HomeWidget(
        onLearn: _navigateTo(Navigation.learn),
        onList: _navigateTo(Navigation.list),
        // onPractice: _navigateTo(Navigation.practice),
        // onSettings: _navigateTo(Navigation.settings),
      );
    }

    if (_navigation == Navigation.learn) {
      return LearnWidget(
          verb: (_learnIndex + _globalIndex < _verbs.length)
              ? _verbs[_learnIndex + _globalIndex]
              : null,
          onBack: _navigateTo(Navigation.home),
          onPressed: _incrementCounter,
          learnIndex: _learnIndex,
          learnLength: _learnCount);
    }

    if (_navigation == Navigation.list) {
      return ListWidget(
        onBack: _navigateTo(Navigation.home),
        index: _learnIndex + _globalIndex,
        verbs: _verbs,
      );
    }

    return null;
  }

  Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/verbs_list.tsv');
  }

  void handleTSV(String tsv, List<Verb> verbs) {
    var lines = tsv.split("\n");

    for (var line in lines) {
      var arr = line.split("\t");
      verbs.add(Verb(i: arr[0], ii: arr[1], iii: arr[2], translation: arr[3]));
    }
  }

  void _incrementCounter() {
    setState(() {
      _learnIndex = (_learnIndex + 1);

      if (_learnIndex > _learnCount) {
        _navigation = Navigation.home;
        _globalIndex += _learnCount + 1;
        _learnIndex = 0;
      }
    });
  }

  Function _navigateTo(Navigation destination) {
    return () {
      setState(() {
        _navigation = destination;
      });
    };
  }
}
