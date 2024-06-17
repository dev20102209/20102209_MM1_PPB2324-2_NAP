import 'package:flutter/material.dart';
import 'package:praktikum_1/constants/color_constant.dart';
import 'package:praktikum_1/constants/text_style_constant.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.primaryBlue,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Image.asset('assets/images/onboarding_money.png'),
            ),
            const SizedBox(height: 43),
            Container(
              width: 315,
              height: 300,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  const SizedBox(height: 33),
                  Text(
                    "Welcome!",
                    style: TextStyleConstant.poppins24,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(26.0),
                    child: Text(
                      "welcome to Fleet Finance, the easy way to improve your finances and help you control expenses and income",
                      textAlign: TextAlign.center,
                      style: TextStyleConstant.poppins_paragraph,
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: 153,
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(const Color(0xff3366FF))),
                      onPressed: () {
                        Navigator.pushNamed(context, '/navbar');
                      },
                      child: Text(
                        "Get Started",
                        style: TextStyleConstant.poppins_14_white
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
