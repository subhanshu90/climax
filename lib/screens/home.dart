import 'package:flutter/material.dart';
import 'package:app/widgets/kard.dart';
import 'package:app/widgets/avatar.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:app/widgets/widgetkardstuffs.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Padding(
                  padding: EdgeInsets.all(25),
                  child: avatar(),
                ),
                Expanded(
                  flex: 3,
                  child: Kard(
                    image: const AssetImage('images/sunny.jpg'),
                    child: KardStuff(),
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: Kard(
                        image: AssetImage('images/air.jpg'), child: Column()))
              ],
            ),
          ]),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              title: const Text('Home'), icon: const Icon(Icons.home)),
          BottomNavyBarItem(
              title: const Text('Search'), icon: const Icon(Icons.search)),
          BottomNavyBarItem(
              title: const Text('Settings'), icon: const Icon(Icons.settings)),
        ],
      ),
    );
  }
}
