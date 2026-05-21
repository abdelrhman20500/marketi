import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/Core/Api/dio_consumer.dart';
import 'package:marketi/Features/Auth/data/repo/auth_repo_impl.dart';
import 'package:marketi/Features/Auth/domain/use_case/login_use_case.dart';
import 'package:marketi/Features/Auth/domain/use_case/register_use_case.dart';
import 'package:marketi/Features/Auth/domain/use_case/reset_password_code_use_case.dart';
import 'package:marketi/Features/Auth/presentation/view/congratulations_screen.dart';
import 'package:marketi/Features/Auth/presentation/view/create_new_password_screen.dart';
import 'package:marketi/Features/Auth/presentation/view/forget_password_screen.dart';
import 'package:marketi/Features/Auth/presentation/view/login_screen.dart';
import 'package:marketi/Features/Auth/presentation/view/register_screen.dart';
import 'package:marketi/Features/Auth/presentation/view/verification_code_screen.dart';
import 'package:marketi/Features/Auth/presentation/view_manager/Login_cubit/login_cubit.dart';
import 'package:marketi/Features/Auth/presentation/view_manager/Register_cubit/register_cubit.dart';
import 'package:marketi/Features/Auth/presentation/view_manager/Reset_password_code_cubit/reset_password_code_cubit.dart';
import 'package:marketi/Features/layout/presentation/view/layout_screen.dart';
import 'package:marketi/Features/splash/presentation/view/splash_screen.dart';
import 'Core/Api/simple_bloc_observer.dart';
import 'Core/cached/shared_pref.dart';
import 'Features/onBoarding/presentation/view/on_boarding_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  // setUpServiceLocator();
  Bloc.observer= SimpleBlocObserver();
  // LoginCubit(LoginUseCase(AuthRepoImpl(apiConsumer: DioConsumer(dio: Dio())))
  // )..login("adamsobhi123@gmail.com", "Adam#123");
  // ResetPasswordCodeCubit(ResetPasswordCodeUseCase(AuthRepoImpl(apiConsumer:
  // DioConsumer(dio: Dio()))))..sendResetCode("adamsobhi523@gmail.com");
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
