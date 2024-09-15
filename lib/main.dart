import 'package:flutter/material.dart';
import 'package:news/Views/homeview.dart';
import 'package:news/Views/loginview.dart';
import 'package:news/Views/registerview.dart';

import 'package:news/Views/splashview.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        LoginScreen.routename: (context) => const LoginScreen(),
        RegisterScreen.routename: (context) => const RegisterScreen(),
      },
    );
  }
}
