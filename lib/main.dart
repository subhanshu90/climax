import 'package:flutter/material.dart';
import 'package:app/screens/home.dart';

void main() => runApp(Climax());

class Climax extends StatelessWidget {
  const Climax({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => Home(),
      },
    );
  }
}
