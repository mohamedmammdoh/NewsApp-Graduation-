import 'package:flutter/material.dart';
import 'package:news/core/%20constants.dart';
import 'package:news/CustomWidgets/custompageviewbuilder.dart';
import 'package:news/CustomWidgets/customsmoothindecator.dart';
import 'package:news/Views/loginview.dart';

class OnBoardingView extends StatelessWidget {
  OnBoardingView({super.key});
  final pagecontroller = PageController();
  static String routename = 'onboardingview';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            CustomPageViewBuilder(
              items: items,
              pageController: pagecontroller,
            ),
            CustomSoomthPageIndicator(
              items: items,
              pagecontroller: pagecontroller,
            ),
            Positioned(
              bottom: 100,
              left: 120,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green,
                ),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, LoginView.routename);
                  },
                  child: Text(
                    'Go to Login and Register',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
