import 'package:flutter/material.dart';

import '../../../../Core/widget/custom_bottom.dart';
import '../../../../Core/widget/custom_text_form_field.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  static const String routeName = "ForgetPasswordScreen";
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back_ios),
          color: const Color(0xFF4A6EFF),),
        title: const Text("Forget Password", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height*0.02),
              Align(
                alignment: Alignment.center,
                child: Image.asset("assets/images/Forgot_Password_With_Email.png",
                  height: height*0.32,fit: BoxFit.cover,),
              ),
              SizedBox(height: height*0.01),
              const Align(
                alignment: Alignment.center,
                child: Text("Please enter your email address to\n       receive a verification code",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black,),),
              ),
              SizedBox(height: height*0.04),
              const Text("Email", style: TextStyle(fontSize: 18,
                fontWeight: FontWeight.w600, color: Colors.black,),),
              SizedBox(height: height*0.01),
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
              CustomBottom(text:"Send Code",
                onPressed: (){},),
            ],
          ),
        ),
      ),
    );
  }
}
