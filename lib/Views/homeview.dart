import 'package:flutter/material.dart';
import 'package:news/Views/newsview.dart';
import 'package:news/Views/settinghsview.dart';
import 'package:news/services/favoritesview.dart';
import 'SearchView.dart';
import 'categoryview.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  static const routename = 'homeview';

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const NewsView(), // Replace with your Home Screen widget
    const SearchView(),
    PageView(), // Create ProfileScreen widget
    const CategoriesScreen(), // Create CategoriesScreen widget
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: 'News'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites'),
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
      appBar: AppBar(
        title: const AppBarTitle(),
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.search),
        //     onPressed: () {
        //       Navigator.pushNamed(context, SearchView.routename);
        //     },
        //   ),
        //   IconButton(
        //     onPressed: () async {
        //       await authCubit.LogOut(context: context);
        //     },
        //     icon: const Icon(
        //       Icons.logout,
        //       // color: Colors.black,
        //     ),
        //   ),
        // ],
      ),
      body: const Padding(
        padding: EdgeInsets.only(right: 5.0, left: 5.0),
        child: Column(
          children: [
            // ListViewCategories(),
            // SizedBox(
            //   height: 10,
            // ),
            Expanded(
              child: ListviewBuilder(
                category: 'world',
              ),
            ),
          ],
        ),
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
