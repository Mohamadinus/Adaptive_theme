import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData.light(),
      dark: ThemeData.dark(),
      initial: AdaptiveThemeMode.system,
      builder: (light, dark) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: light,
        darkTheme: dark,
        home: const Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _check = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Light and Dark Theme")),
        body: Center(
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _check = !_check;
                    _check
                        ? AdaptiveTheme.of(context).setLight()
                        : AdaptiveTheme.of(context).setDark();
                  });
                },
                child: Text(_check ? "light" : "dark"))));
  }
}
