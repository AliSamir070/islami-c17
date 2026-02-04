import '../core/resources/AssetsManager.dart';

class Onboardingmodel {
  String Image;
  String title;
  String? Desc;

  Onboardingmodel({required this.Image, required this.title, this.Desc});

  static List<Onboardingmodel> dataList = [
    Onboardingmodel(
      Image: AssetsManager.onboarding_1,
      title: 'Welcome To Isalmi App',
    ),
    Onboardingmodel(
      Image: AssetsManager.onboarding_2,
      title: 'Welcome To Islami',
      Desc: "We Are Very Excited To Have You In Our Community",
    ),
    Onboardingmodel(
      Image: AssetsManager.onboarding_3,
      title: 'Reading the Quran',
      Desc: "Read, and your Lord is the Most Generous",
    ),
    Onboardingmodel(
      Image: AssetsManager.onboarding_4,
      title: 'Bearish',
      Desc: "Praise the name of your Lord, the Most High",
    ),
    Onboardingmodel(
      Image: AssetsManager.onboarding_5,
      title: 'Holy Quran Radio',
      Desc:
          "You can listen to the Holy Quran Radio through the application for free and easily",
    ),
  ];
}
