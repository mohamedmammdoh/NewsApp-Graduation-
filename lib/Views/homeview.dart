import 'package:flutter/material.dart';
import 'package:news/Views/newsview.dart';
import 'package:news/Views/profileview.dart';
import 'package:news/Views/settinghsview.dart';

import 'SearchView.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  static const routename = 'homeview';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;
  List<Widget> screens = [
    NewsView(),
    SettengthView(),
    ProfileView(),
  ];
  List<String> appbartitle = [
    'Universal Update',
    'Settings View',
    'Profile View'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: 'News'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
        ],
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
      ),
      appBar: AppBar(
        title: Text(appbartitle[_currentIndex]),
        centerTitle: true,
        leading: Icon(
          Icons.waving_hand,
          color: Colors.amber,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.pushNamed(context, SearchView.routename);
            },
          ),
        ],
      ),
      body: screens[_currentIndex],
    );
  }
}
