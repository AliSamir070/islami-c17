import 'package:flutter/material.dart';
import 'package:islami_c17/core/resources/AssetsManager.dart';
import 'package:islami_c17/core/resources/ColorsManager.dart';
import 'package:islami_c17/model/onboardingModel.dart';
import 'package:islami_c17/ui/home/screen/home_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  static const String routeName = "onboarding";

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  PageController pageController = PageController(initialPage: 0);
  var dataList = Onboardingmodel.dataList;
  int index = 0;

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

            Expanded(
              child: PageView.builder(
                itemCount: Onboardingmodel.dataList.length,
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    index = value;
                  });
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Spacer(),
                        Image.asset(dataList[index].Image),
                        Spacer(),
                        Text(
                          dataList[index].title,
                          style: TextStyle(
                            color: ColorsManager.primaryColor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          dataList[index].Desc ?? "",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ColorsManager.primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                index == 0
                    ? SizedBox(width: 65)
                    : TextButton(
                        onPressed: () {
                          pageController.previousPage(
                            duration: Duration(milliseconds: 200),
                            curve: Curves.easeInSine,
                          );
                        },
                        child: Text(
                          "Back",
                          style: TextStyle(
                            color: ColorsManager.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                SmoothPageIndicator(
                  controller: pageController,
                  count: dataList.length,
                  effect: ExpandingDotsEffect(
                    dotWidth: 7.0,
                    dotHeight: 7.0,
                    dotColor: Colors.grey,
                    activeDotColor: ColorsManager.primaryColor,
                  ),

                  onDotClicked: (index) {},
                ),
                index == dataList.length - 1
                    ? TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, HomeScreen.routeName);
                        },
                        child: Text(
                          "Skip",
                          style: TextStyle(
                            color: ColorsManager.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : TextButton(
                        onPressed: () {
                          pageController.nextPage(
                            duration: Duration(milliseconds: 200),
                            curve: Curves.easeInSine,
                          );
                        },
                        child: Text(
                          "Next",
                          style: TextStyle(
                            color: ColorsManager.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
