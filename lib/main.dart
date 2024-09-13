import 'package:flutter/material.dart';
import 'package:news/Views/homeview.dart';
import 'package:news/Views/splashview.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme:
              const AppBarTheme(backgroundColor: Colors.white, elevation: 0.0)),
      initialRoute: SplashScreen.routename,
      routes: {
        SplashScreen.routename: (context) => const SplashScreen(),
        NewsView.routename: (context) => const NewsView(),
      },
    );
  }
}
