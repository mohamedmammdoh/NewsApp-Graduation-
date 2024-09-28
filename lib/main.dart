import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news/Views/homeview.dart';
import 'package:news/Views/loginview.dart';
import 'package:news/Views/registerview.dart';

import 'package:news/Views/splashview.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Views/SearchView.dart';
import 'learn/messenger_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const NewsApp());
}

class NewsApp extends StatefulWidget {
  const NewsApp({super.key});

  @override
  State<NewsApp> createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  //check for user!!
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        // scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(elevation: 0.0),
      ),
      // home: SplashScreen(),
      initialRoute: MassengerView.routename,
      routes: {
        SplashScreen.routename: (context) => const SplashScreen(),
        NewsView.routename: (context) => const NewsView(),
        LoginView.routename: (context) => const LoginView(),
        RegisterView.routename: (context) => const RegisterView(),
        SearchView.routename: (context) => const SearchView(),

        // RegisterScreen.routename: (context) => const RegisterScreen(),
      },
    );
  }
}
