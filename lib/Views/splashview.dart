import 'package:flutter/material.dart';
import 'package:news/Views/homeview.dart';
import 'package:news/Views/loginview.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const routename = 'splashscreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        microseconds: 30000,
      ),
    );
    fadingAnimation =
        Tween<double>(begin: 0.2, end: 1).animate(animationController!);

    animationController!.repeat(reverse: true);
    GoToNextView();
    super.initState();
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  AnimationController? animationController;
  Animation? fadingAnimation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assests/images/resize.webp',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: AnimatedBuilder(
          animation: fadingAnimation!,
          builder: (context, _) => Opacity(
            opacity: fadingAnimation!.value,
            child: const Center(
              child: Text(
                'News App',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  fontSize: 55,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  GoToNextView() {
    Future.delayed(
      const Duration(seconds: 4),
      () {
        Navigator.pushReplacementNamed(context, LoginScreen.routename);
      },
    );
  }
}
