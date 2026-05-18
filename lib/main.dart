import 'package:flutter/material.dart';
import 'package:marketi/Features/splash/presentation/view/splash_screen.dart';
import 'Features/onBoarding/presentation/view/on_boarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      routes: {
       SplashScreen.routeName:(_)=>const SplashScreen(),
        OnBoardingScreen.routeName:(_)=>const OnBoardingScreen(),
      },
      initialRoute: OnBoardingScreen.routeName,
    );
  }
}
