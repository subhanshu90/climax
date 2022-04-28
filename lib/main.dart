import 'package:flutter/material.dart';
import 'package:app/screens/home.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:google_fonts/google_fonts.dart';

ColorScheme? bruh;
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Climax());
}

const kolor = Color.fromARGB(255, 215, 11, 8);

class Climax extends StatelessWidget {
  const Climax({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        ColorScheme lightColorScheme;
        ColorScheme darkColorScheme;
        bruh = darkDynamic;
        if (lightDynamic != null && darkDynamic != null) {
          lightColorScheme = lightDynamic.harmonized();
          darkColorScheme = darkDynamic.harmonized();
        } else {
          lightColorScheme = ColorScheme.fromSeed(
            seedColor: kolor,
          );
          darkColorScheme = ColorScheme.fromSeed(
            seedColor: kolor,
            brightness: Brightness.dark,
          );
        }
        return MaterialApp(
          theme: ThemeData(
            colorScheme: lightColorScheme,
            textTheme: GoogleFonts.poppinsTextTheme(),
          ),
          darkTheme: ThemeData(colorScheme: darkColorScheme),
          themeMode: ThemeMode.system,
          initialRoute: '/home',
          routes: {
            '/home': (context) => SafeArea(child: Home()),
          },
        );
      },
    );
  }
}
