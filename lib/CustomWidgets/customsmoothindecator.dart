import 'package:flutter/material.dart';
import 'package:news/Models/onboardingmodel.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomSoomthPageIndicator extends StatelessWidget {
  CustomSoomthPageIndicator(
      {super.key, required this.items, required this.pagecontroller});
  List<OnBoarding> items;
  PageController pagecontroller = PageController();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 190,
      left: 160,
      child: SmoothPageIndicator(
        count: items.length,
        controller: pagecontroller,
        axisDirection: Axis.horizontal,
        effect: const SlideEffect(
          spacing: 10.0,
          radius: 90.0,
          dotWidth: 20.0,
          dotHeight: 20.0,
          strokeWidth: 1.5,
          dotColor: Colors.grey,
          activeDotColor: Colors.green,
        ),
      ),
    );
  }
}
