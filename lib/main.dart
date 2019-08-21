import 'package:flutter/material.dart';
import 'package:music_player/home/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final Color primaryColor = const Color(0xFF8FB9A8);
  final Color primaryColorLight = const Color(0xFFbbf2dc);
  final Color primaryColorDark = const Color(0xFF6c8c7f);
  final Color backgroundColor = const Color(0xFF765D69);
  final Color dialogBackgroundColor = const Color(0xFFFCD0BA);
  final Color accentColor = const Color(0xFFF1828D);
  final Color highlightColor = const Color(0xFFFEFAD4);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Visual Music Player',
      theme: ThemeData(
        // Colors
        primaryColor: primaryColor,
        primaryColorLight: primaryColorLight,
        primaryColorDark: primaryColorDark,
        backgroundColor: backgroundColor,
        dialogBackgroundColor: dialogBackgroundColor,
        accentColor: accentColor,
        highlightColor: highlightColor,

        // Texts
        textTheme: Typography.blackCupertino
            .apply(displayColor: primaryColor, bodyColor: primaryColor),
      ),
      home: Material(child: Home()),
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(),
      body: Center(
        child: Home(),
      ),
    );
  }
}
