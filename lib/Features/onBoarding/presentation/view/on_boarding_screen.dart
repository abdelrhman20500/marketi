import 'package:flutter/material.dart';
import 'package:marketi/Features/onBoarding/presentation/view/widget/on_boarding_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../data/model/on_boarding_model.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});
  static const String routeName = "OnBoardingScreen";

  @override
  State<OnBoardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnBoardingScreen> {
  final PageController boardController = PageController();
  bool isLast = false;

  final List<OnboardingModel> boarding = [
    OnboardingModel(
      image: "assets/images/Onboarding_1.png",
      title: "Welcome to Marketi",
      description:
      "Discover a world of endless possibilities and shop from the comfort of your fingertips. Browse through a wide range of products, from fashion and electronics to home.",
    ),
    OnboardingModel(
      image: "assets/images/Onboarding_2.png",
      title: "Easy to Buy",
      description:
      "Find the perfect item that suits your style and needs with secure payment options and fast delivery. Shopping has never been easier.",
    ),
    OnboardingModel(
      image: "assets/images/Onboarding_3.png",
      title: "Wonderful User Experience",
      description:
      "Start exploring now and experience the convenience of online shopping at its best.",
    ),
  ];

  void _onPageChanged(int index) {
    setState(() {
      isLast = (index == boarding.length - 1);
    });
  }

  void _nextPage() {
    if (isLast) {
      // TODO: Navigate to Login or SignUp
      // Navigator.pushReplacementNamed(context, SignUpScreen.routeName);
    } else {
      boardController.nextPage(
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: boardController,
                onPageChanged: _onPageChanged,
                physics: const BouncingScrollPhysics(),
                itemCount: boarding.length,
                itemBuilder: (context, index) =>
                    OnBoardingItem(model: boarding[index]),
              ),
            ),
            SizedBox(height: height*0.01),
            SmoothPageIndicator(
              controller: boardController,
              count: boarding.length,
              effect: const ExpandingDotsEffect(
                dotColor: Colors.grey,
                activeDotColor: Colors.blue,
                dotHeight: 10,
                dotWidth: 10,
                spacing: 6.0,
                expansionFactor: 2,
              ),
            ),
            SizedBox(height: height*0.04),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: _nextPage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 5,
                ),
                child: Text(
                  isLast ? "Get Started" : "Next",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: height*0.03),
          ],
        ),
      ),
    );
  }
}