import 'package:flutter/material.dart';
import 'package:marketi/Features/Auth/presentation/view/congratulations_screen.dart';
import 'package:marketi/Features/Auth/presentation/view/create_new_password_screen.dart';
import 'package:marketi/Features/Auth/presentation/view/forget_password_screen.dart';
import 'package:marketi/Features/Auth/presentation/view/login_screen.dart';
import 'package:marketi/Features/Auth/presentation/view/register_screen.dart';
import 'package:marketi/Features/Auth/presentation/view/verification_code_screen.dart';
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
      // home: ForgetPasswordScreen()
      routes: {
       SplashScreen.routeName:(_)=>const SplashScreen(),
        OnBoardingScreen.routeName:(_)=>const OnBoardingScreen(),
        LoginScreen.routeName:(_)=>const LoginScreen(),
        RegisterScreen.routeName:(_)=>const RegisterScreen(),
        ForgetPasswordScreen.routeName:(_)=>ForgetPasswordScreen(),
        VerificationCodeScreen.routeName:(_)=> VerificationCodeScreen(),
      },
      initialRoute: VerificationCodeScreen.routeName,
    );
  }
}
