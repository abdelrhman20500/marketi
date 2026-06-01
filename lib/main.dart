import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/Features/layout/presentation/view/layout_screen.dart';
import 'Core/Api/simple_bloc_observer.dart';
import 'Core/cached/shared_pref.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  Bloc.observer= SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      home: LayoutScreen()
      // routes: {
      //  SplashScreen.routeName:(_)=>const SplashScreen(),
      //   OnBoardingScreen.routeName:(_)=>const OnBoardingScreen(),
      //   LoginScreen.routeName:(_)=>const LoginScreen(),
      //   RegisterScreen.routeName:(_)=>const RegisterScreen(),
      //   ForgetPasswordScreen.routeName:(_)=>ForgetPasswordScreen(),
      //   VerificationCodeScreen.routeName:(_)=> VerificationCodeScreen(),
      // },
      // initialRoute: VerificationCodeScreen.routeName,
    );
  }
}
