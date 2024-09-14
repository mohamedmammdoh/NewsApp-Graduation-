import 'package:flutter/material.dart';
import 'package:news/Views/homeview.dart';
import 'package:news/Views/loginview.dart';
import 'package:news/Views/registerview.dart';
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
      theme: ThemeData.dark().copyWith(
        // scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(elevation: 0.0),
      ),
      initialRoute: SplashScreen.routename,
      routes: {
        SplashScreen.routename: (context) => const SplashScreen(),
        NewsView.routename: (context) => const NewsView(),
        LoginView.routename: (context) => const LoginView(),
        RegisterView.routename: (context) => const RegisterView(),
      },
    );
  }
}
