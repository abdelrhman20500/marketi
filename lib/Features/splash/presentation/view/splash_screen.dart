import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static String routeName ="SplashScreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Future.delayed(const Duration(seconds: 3),(){
    //   Navigator.pushNamed(context, HomeScreen.routeName);
    // });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/images/Logo_Splash_Screen.png",
            fit: BoxFit.fill),
      ),
    );
  }
}
