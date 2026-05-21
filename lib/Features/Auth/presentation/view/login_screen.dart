import 'package:flutter/material.dart';
import 'package:marketi/Core/widget/custom_bottom.dart';
import 'package:marketi/Core/widget/sign_with_social_media.dart';
import '../../../../Core/widget/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String routeName = "LoginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(height: height*0.014),
                TextButton(
                  onPressed: () {},
                  child: const Text("Skip", style:
                  TextStyle(color: Color(0xFF4A6EFF), fontSize: 16),),),
              ],
            ),
            SizedBox(height: height*0.02),
            Image.asset("assets/images/Logo_Splash_Screen.png",
              height: height*0.22,fit: BoxFit.cover,),
            SizedBox(height: height*0.01),
            const Text("Marketi",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF4A6EFF),),),
            SizedBox(height: height*0.04),
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
              obscureText: _obscurePassword,
              suffixIcon: IconButton(
                icon: Icon(_obscurePassword
                      ? Icons.visibility_off : Icons.visibility,
                  color: Colors.white70,),
                onPressed: () =>
                    setState(() => _obscurePassword = !_obscurePassword),
              ),
              validator: (value) =>
              value!.length < 6 ? "Password must be at least 6 characters" : null,
            ),
            SizedBox(height: height*0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: _rememberMe,
                      onChanged: (value) {
                        setState(() => _rememberMe = value!);
                      },
                      activeColor: const Color(0xFF4A6EFF),),
                    const Text("Remember Me"),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text("Forgot Password ?",
                    style: TextStyle(color: Color(0xFF4A6EFF)),),),
              ],
            ),
            SizedBox(height: height*0.02),
            CustomBottom(text:"Login",
              onPressed: (){},),
            SizedBox(height: height*0.02),
            const Text("Or Continue With", style: TextStyle(color: Colors.grey),),
            SizedBox(height: height*0.02),
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
            SizedBox(height: height*0.01),

            // Register Link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Are you new in Marketi "),
                InkWell(
                  onTap: () {},
                  child: const Text("register ?",
                    style: TextStyle(color: Color(0xFF4A6EFF),fontWeight: FontWeight.bold,),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}