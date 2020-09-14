import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:ivflutter/pages/homePage.dart';
import 'package:ivflutter/pages/listPage.dart';
import 'package:ivflutter/pages/practicePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/learnPage.dart';
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

    SharedPreferences.getInstance()
        .then((share) => _globalIndex = share.getInt('global index') ?? 0);

    SharedPreferences.getInstance()
        .then((share) => _learnIndex = share.getInt('learn index') ?? 0);

    loadAsset().then((value) => setState(() {
          handleTSV(value, _verbs);
        }));
  }

  @override
  Widget build(BuildContext context) {
    return _navigate();
  }

  Widget _navigate() {
    if (_navigation == Navigation.home) {
      return HomePage(
        onLearn: _navigateTo(Navigation.learn),
        onPractice: _globalIndex > 0 ? _navigateTo(Navigation.practice) : null,
        onList: _globalIndex > 0 ? _navigateTo(Navigation.list) : null,
        // onSettings: _navigateTo(Navigation.settings),
      );
    }

    if (_navigation == Navigation.learn) {
      return LearnPage(
          verb: (_learnIndex + _globalIndex < _verbs.length)
              ? _verbs[_learnIndex + _globalIndex]
              : null,
          onBack: _navigateTo(Navigation.home),
          onPressed: _incrementCounter,
          learnIndex: _learnIndex,
          learnLength: _learnCount);
    }

    if (_navigation == Navigation.list) {
      return ListPage(
        onBack: _navigateTo(Navigation.home),
        index: _learnIndex + _globalIndex,
        verbs: _verbs,
      );
    }

    if (_navigation == Navigation.practice) {
      return PracticePage(
        onBack: _navigateTo(Navigation.home),
        maxIndex: _learnIndex + _globalIndex,
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
      var verb = Verb(i: arr[0], ii: arr[1], iii: arr[2], translation: arr[3]);
      verb.loadValue();
      verbs.add(verb);
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

      SharedPreferences.getInstance().then((share) => {
            share.setInt('global index', _globalIndex),
            share.setInt('learn index', _learnIndex)
          });
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
