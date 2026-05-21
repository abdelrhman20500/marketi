import 'package:flutter/material.dart';

import '../../../../Core/widget/custom_bottom.dart';

class CongratulationsScreen extends StatelessWidget {
  const CongratulationsScreen({super.key});

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
              SizedBox(height: height*0.05),
              Align(
                alignment: Alignment.center,
                child: Image.asset("assets/images/Congratulations.png",
                  height: height*0.32,fit: BoxFit.cover,),
              ),
              SizedBox(height: height*0.02),
              const Align(
                alignment: Alignment.center,
                child: Text("Congratulations",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black,),),
              ),
              SizedBox(height: height*0.03),
              const Align(
                alignment: Alignment.center,
                child: Text("You have updated the password. please \n login again with your latest password",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black,),),
              ),
              SizedBox(height: height*0.04),
              CustomBottom(text: "Login",onPressed: (){},)
            ],
          ),
        ),
      ),
    );
  }
}
