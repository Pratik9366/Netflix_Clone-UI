import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:netflix_ui/pages/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {super.initState();
  //navigatetohome();
  }

  /*navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 6000), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ));
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.asset('lib/images/splash.json'), nextScreen: const HomePage(),
    backgroundColor: Colors.black,
    splashIconSize: 600, 
    duration: 2900,
    );
  }
}
