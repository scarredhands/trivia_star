import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:trivia_star/homePage.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});
  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 2), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => homePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LottieBuilder.asset('lib/image/animation.json'),
      ),
    );
  }
}
