import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Views/profileview.dart';
import 'package:news/Views/settinghsview.dart';

import '../cubit/Auth/AuthCubit.dart';
import 'SearchView.dart';
import 'categoryview.dart';
import 'newsview.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  static const routename = 'mainview';

  @override
  State<MainView> createState() => _NewsViewState();
}

class _NewsViewState extends State<MainView> {
  int _currentIndex = 0;
  List<Widget> screens = [
    NewsView(),
    CategoriesScreen(),
    ProfileScreen(),
    SettingsView(),
  ];
  List<String> appbartitle = [
    'Universal Update',
    'Categories Screen',
    'Profile Screen',
    'Settings Screen',
  ];
  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);
    return Scaffold(
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
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: 'News'),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Category'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
      ),
    );
  }
}
