import 'package:app/screens/homescreenmain.dart';
import 'package:app/screens/search.dart';
import 'package:flutter/material.dart';
import 'settings.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  final screens = [const homescreen(), const Search(), const Settings()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: screens[index],
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(),
          child: NavigationBar(
            selectedIndex: index,
            onDestinationSelected: (index) {
              setState(() {
                this.index = index;
              });
            },
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home),
                label: 'Home',
                selectedIcon: Icon(Icons.home_filled),
              ),
              NavigationDestination(
                icon: Icon(Icons.search),
                label: 'Search',
                selectedIcon: Icon(Icons.search_sharp),
              ),
              NavigationDestination(
                icon: Icon(Icons.settings),
                label: 'Settings',
                selectedIcon: Icon(Icons.settings),
              )
            ],
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            elevation: 0,
            animationDuration: const Duration(seconds: 1),
            height: 60,
          ),
        ));
  }
}
