import 'package:flutter/material.dart';
import 'package:news/Models/onboardingmodel.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({super.key, required this.onBoarding});
  final OnBoarding onBoarding;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          onBoarding.image,
          width: 200,
          height: 200,
        ),
        const SizedBox(height: 5),
        Text(
          onBoarding.text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          onBoarding.description,
          style: const TextStyle(fontWeight: FontWeight.w400),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
