import 'package:flutter/material.dart';
import 'package:app/screens/home.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

void main() => runApp(Climax());

class Climax extends StatelessWidget {
  const Climax({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: FlexThemeData.light(scheme: FlexScheme.blueWhale),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.blueWhale),
      themeMode: ThemeMode.system,
      initialRoute: '/home',
      routes: {
        '/home': (context) => SafeArea(child: Home()),
      },
    );
  }
}
