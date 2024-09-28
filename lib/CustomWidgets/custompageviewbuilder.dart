import 'package:flutter/material.dart';
import 'package:news/CustomWidgets/Onboardingbody.dart';
import 'package:news/Models/onboardingmodel.dart';

class CustomPageViewBuilder extends StatelessWidget {
  CustomPageViewBuilder(
      {super.key, required this.items, required this.pageController});
  PageController pageController = PageController();
  List<OnBoarding> items;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return OnBoardingBody(onBoarding: items[index]);
      },
    );
  }
}
