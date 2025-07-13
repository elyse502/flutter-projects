import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GoMoon',
      // Set the primary color to a dark shade for all scaffolds
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromRGBO(31, 31, 31, 1.0),
      ),
      home: Scaffold(
        // Set the background color of the scaffold to a dark shade (not for all scaffolds but for the main one)
        // backgroundColor: Color.fromRGBO(31, 31, 31, 1.0),
      ),
    );
  }
}
