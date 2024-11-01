import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:news/Views/MainView.dart';
import 'package:news/Views/newsview.dart';
import 'package:news/Views/settinghsview.dart';
import 'package:news/core/ThemeApp.dart';
import 'package:news/Views/loginview.dart';
import 'package:news/Views/onboardingview.dart';
import 'package:news/Views/registerview.dart';
import 'package:news/Views/splashview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:news/cubit/Auth/AuthCubit.dart';
import 'Views/SearchView.dart';

void main() async {
  await GetStorage.init();
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
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: GetMaterialApp(
        darkTheme: ThemeService().darkTheme,
        themeMode: ThemeService().getThemeMode(),
        debugShowCheckedModeBanner: false,
        theme: ThemeService().lightTheme,
        initialRoute: SplashScreen.routename,
        routes: {
          MainView.routename: (context) => const MainView(),
          SplashScreen.routename: (context) => const SplashScreen(),
          OnBoardingView.routename: (context) => OnBoardingView(),
          LoginView.routename: (context) => LoginView(),
          RegisterView.routename: (context) => RegisterView(),
          NewsView.routename: (context) => const NewsView(),
          SearchView.routename: (context) => const SearchView(),
          SettingsView.routename: (context) => SettingsView(),
        },
      ),
    );
  }
}
