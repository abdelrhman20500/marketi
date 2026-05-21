import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/Core/Api/dio_consumer.dart';
import 'package:marketi/Core/utlis/error_dialog.dart';
import 'package:marketi/Core/utlis/loading_dialog.dart';
import 'package:marketi/Core/utlis/success_dialog.dart';
import 'package:marketi/Features/Auth/data/repo/auth_repo_impl.dart';
import 'package:marketi/Features/Auth/domain/use_case/register_use_case.dart';
import 'package:marketi/Features/Auth/presentation/view_manager/Register_cubit/register_cubit.dart';
import 'package:marketi/Features/Auth/presentation/view_manager/Register_cubit/register_state.dart';

import '../../../../Core/widget/custom_bottom.dart';
import '../../../../Core/widget/custom_text_form_field.dart';
import '../../../../Core/widget/sign_with_social_media.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const String routeName ="RegisterScreen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => RegisterCubit(RegisterUseCase(AuthRepoImpl(
          apiConsumer: DioConsumer(dio: Dio())))),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if(state is RegisterLoading)
            {
              showLoadingDialog(context);
            }else if(state is RegisterFailure){
            closeLoadingDialog(context);
            showErrorDialog(context, state.error);
          }else if(state is RegisterSuccess)
            {
              closeLoadingDialog(context);
              showSuccessDialog(context, state.registerModel.message!);
            }
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            child: Scaffold(
              body: SingleChildScrollView(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    SizedBox(height: height*0.014),
                    Row(
                      children: [
                        IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back_ios),
                          color: const Color(0xFF4A6EFF),)
                      ],
                    ),
                    SizedBox(height: height*0.014),
                    Image.asset("assets/images/Logo_Splash_Screen.png",
                      height: height*0.14,fit: BoxFit.cover,),
                    const Text("Marketi",
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF4A6EFF),),),
                    SizedBox(height: height*0.04),
                    CustomTextFormField(
                      controller: nameController,
                      hint: "Name",
                      prefixIcon: const Icon(Icons.person_outline),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: height*0.02),
                    CustomTextFormField(
                      controller: phoneController,
                      hint: "phone",
                      prefixIcon: const Icon(Icons.phone_android),
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(height: height*0.02),
                    CustomTextFormField(
                      controller: emailController,
                      hint: "Email Address",
                      prefixIcon: const Icon(Icons.email_outlined),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) return "Email is required";
                        if (!value.contains("@")) return "Enter a valid email";
                        return null;
                      },
                    ),
                    SizedBox(height: height*0.02),
                    CustomTextFormField(
                      controller: passwordController,
                      hint: "Password",
                      prefixIcon: const Icon(Icons.lock_outline),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: _obscurePassword,
                      suffixIcon: IconButton(
                        icon: Icon(_obscurePassword
                            ? Icons.visibility_off : Icons.visibility,
                          color: Colors.black,),
                        onPressed: () =>
                            setState(() => _obscurePassword = !_obscurePassword),
                      ),
                      validator: (value) =>
                      value!.length < 6 ? "Password must be at least 6 characters" : null,
                    ),
                    SizedBox(height: height*0.02),
                    CustomTextFormField(
                      controller: confirmPasswordController,
                      hint: "Confirm Password",
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(_obscurePassword
                            ? Icons.visibility_off : Icons.visibility,
                          color: Colors.black,),
                        onPressed: () =>
                            setState(() => _obscurePassword = !_obscurePassword),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) =>
                      value!.length < 6 ? "Password must be at least 6 characters" : null,
                    ),
                    SizedBox(height: height*0.02),
                    CustomBottom(text:"Sign Up",
                      onPressed: (){
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<RegisterCubit>(context).register(
                              nameController.text,
                              phoneController.text,
                              emailController.text,
                              passwordController.text,
                              confirmPasswordController.text
                          );}
                      },),
                    SizedBox(height: height*0.01),
                    const Text("Or Continue With", style: TextStyle(color: Colors.grey),),
                    SizedBox(height: height*0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SignWithSocialMedia(icon: Icons.g_mobiledata, color: Colors.black),
                        SizedBox(width: width*0.05),
                        const SignWithSocialMedia(icon: Icons.apple, color: Colors.black),
                        SizedBox(width: width*0.05),
                        const SignWithSocialMedia(icon: Icons.facebook, color: Colors.black),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
