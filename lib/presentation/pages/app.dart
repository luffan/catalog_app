import 'package:flutter/material.dart';

import 'explore/explore_page.dart';
import 'home/home_page.dart';
import 'profile/profile_page.dart';

class App extends StatefulWidget {

  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  var _currentTab = 0;

  final List<Widget> _tabs = [
    const HomePage(),
    const ExplorePage(),
    const ProfilePage(),
  ];

  Widget get bottomNavigationBar {
    return BottomNavigationBar(
      currentIndex: _currentTab,
      onTap: (int index) => setState(() => _currentTab = index),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Profile',
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:  _tabs[_currentTab],
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
