import 'package:flutter/material.dart';
import 'package:islami_c17/core/resources/AssetsManager.dart';
import 'package:islami_c17/core/resources/ColorsManager.dart';
import 'package:islami_c17/model/onboarding_list.dart';
import 'package:islami_c17/ui/home/screen/home_screen.dart';
import 'package:islami_c17/ui/onboarding_screen/widget/onboarding_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routName = "onboarding";

  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController controller = PageController();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ColorsManager.secondaryColor,
      appBar: AppBar(
        toolbarHeight: height * 0.17,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Image.asset(AssetsManager.islamiHeader, width: width * 0.6),
      ),
      body: PageView.builder(
        controller: controller,
        onPageChanged: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        itemCount: OnboardingList.boadrdingList.length,
        itemBuilder: (context, index) =>
            OnboardingItem(OnboardingList.boadrdingList[index]),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            selectedIndex==0?Text("                 "):
            TextButton(
              onPressed: () {
                controller.previousPage(
                  curve: Curves.easeInOut,
                  duration: Duration(milliseconds: 300),
                );
              },
              child: Text(
                "Back",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: ColorsManager.primaryColor,
                ),
              ),
            ),
            SmoothPageIndicator(
              controller: controller,
              count: 5,
              effect: WormEffect(
                dotHeight: 7,
                dotWidth: 7,
                dotColor: ColorsManager.dotsColor,
                activeDotColor: ColorsManager.primaryColor
              ),
            ),
            TextButton(
              onPressed: () {
                controller.nextPage(
                  curve: Curves.easeInOut,
                  duration: Duration(milliseconds: 300),
                );
                if(selectedIndex==4){
                  Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
                }
              },
              child: Text(
                selectedIndex==4?"Finish":"Next",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: ColorsManager.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
