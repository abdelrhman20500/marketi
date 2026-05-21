import 'package:flutter/material.dart';

import '../../../../Core/widget/custom_bottom.dart';
import '../../../../Core/widget/custom_text_form_field.dart';

class CreateNewPasswordScreen extends StatelessWidget {
   CreateNewPasswordScreen({super.key});
  static const String routeName ="CreateNewPasswordScreen";

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back_ios),
          color: const Color(0xFF4A6EFF),),
        title: const Text("Create New Password", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
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
                child: Image.asset("assets/images/Create_New_Password.png",
                  height: height*0.32,fit: BoxFit.cover,),
              ),
              SizedBox(height: height*0.01),
              const Align(
                alignment: Alignment.center,
                child: Text("    New password must be\ndifferent from last password",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey,),),
              ),
              SizedBox(height: height*0.04),
              const Text("Password", style: TextStyle(fontSize: 18,
                fontWeight: FontWeight.w600, color: Colors.black,),),
              SizedBox(height: height*0.01),
              CustomTextFormField(
                controller: passwordController,
                hint: "Password",
                prefixIcon: const Icon(Icons.lock_open_outlined),
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: height*0.02),
              const Text("Confirm Password", style: TextStyle(fontSize: 18,
                fontWeight: FontWeight.w600, color: Colors.black,),),
              SizedBox(height: height*0.01),
              CustomTextFormField(
                controller: confirmPasswordController,
                hint: "Confirm Password",
                prefixIcon: const Icon(Icons.lock_open_outlined),
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: height*0.03),
              CustomBottom(text: "Save Password",onPressed: (){},)
            ],
          ),
        ),
      ),
    );
  }
}
