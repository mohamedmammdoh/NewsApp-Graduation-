import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Views/profileview.dart';

import '../CustomWidgets/appbartitle.dart';
import '../cubit/Auth/AuthCubit.dart';
import 'SearchView.dart';
import 'categoryview.dart';
import 'homeview.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  static const routename = 'mainview';

  @override
  State<MainView> createState() => _NewsViewState();
}

class _NewsViewState extends State<MainView> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const NewsView(), // Replace with your Home Screen widget
    const SearchView(),
    const ProfileScreen(), // Create ProfileScreen widget
    const CategoriesScreen(), // Create CategoriesScreen widget
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);
    return Scaffold(
      // appBar: AppBar(
      //   title: const AppBarTitle(),
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.logout),
      //       onPressed: () async {
      //         await authCubit.LogOut(context: context);
      //       },
      //     ),
      //   ],
      // ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Categories'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
