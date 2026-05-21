import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:marketi/Core/widget/custom_bottom.dart';

class VerificationCodeScreen extends StatelessWidget {
  VerificationCodeScreen({super.key});

  static const routeName ="VerificationCodeScreen";

  String? otpCode;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back_ios),
          color: const Color(0xFF4A6EFF),),
        title: const Text("Verification Code", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
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
                child: Image.asset("assets/images/Verification_Code_With_Email.png",
                  height: height*0.32,fit: BoxFit.cover,),
              ),
              SizedBox(height: height*0.01),
              const Align(
                alignment: Alignment.center,
                child: Text("Please enter your email address to\n       receive a verification code",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey,),),
              ),
              SizedBox(height: height*0.04),
              OtpTextField(
                numberOfFields: 4,
                fieldWidth: 54,
                showFieldAsBox: true,
                cursorColor: const Color(0xFF4A6EFF),
                textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),
                borderColor: const Color(0xFF4A6EFF),
                enabledBorderColor: const Color(0xFF4A6EFF),
                focusedBorderColor: const Color(0xFF4A6EFF),
                disabledBorderColor: Colors.grey,
                onSubmit: (verificationCode) {
                  otpCode = verificationCode;
                },
              ),
              SizedBox(height: height*0.04),
              CustomBottom(text: "Verify Code",onPressed: (){},)
            ],
          ),
        ),
      ),
    );
  }
}
