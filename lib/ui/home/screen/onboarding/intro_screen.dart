import 'package:flutter/material.dart';
import 'package:islami_c17/core/resources/ColorsManager.dart';
import 'package:islami_c17/ui/home/screen/onboarding/widgets/app_text_button.dart';
import 'package:islami_c17/ui/home/screen/onboarding/widgets/dots_indicator.dart';
import 'package:islami_c17/ui/home/screen/onboarding/widgets/page_item.dart';
import '../../../../core/resources/AssetsManager.dart';
import '../../../../model/intro_page_model.dart';
import '../home_screen.dart';

class IntroScreen extends StatefulWidget {
  static const String routeName = "intro";

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  void nextPage() {
    if (currentIndex < pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      finishOnboarding();
    }
  }

  void backPage() {
    if (currentIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void finishOnboarding() {
    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorsManager.secondaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                AssetsManager.islamiHeader,
                height: 0.16 * height,
                fit: BoxFit.fitHeight,
              ),
            ),
            SizedBox(height: 0.1 * height),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: pages.length,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return PageItem(model: pages[index]);
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  currentIndex == 0
                      ? Expanded(child: const SizedBox())
                      : Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: AppTextButton(
                              text: "Back",
                              onPressed: backPage,
                            ),
                          ),
                        ),
                  Expanded(
                    child: DotsIndicator(
                      count: pages.length,
                      currentIndex: currentIndex,
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: AppTextButton(
                        text: currentIndex == pages.length - 1
                            ? "Finish"
                            : "Next",
                        onPressed: nextPage,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
