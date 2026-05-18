import 'package:flutter/material.dart';

import '../../../data/model/on_boarding_model.dart';

class OnBoardingItem extends StatelessWidget {
  final OnboardingModel model;

  const OnBoardingItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            model.image,
            height: height*0.36,
            fit: BoxFit.contain,
          ),
          SizedBox(height: height*0.05),
          Text(
            model.title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: height*0.02),
          Text(
            model.description,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}