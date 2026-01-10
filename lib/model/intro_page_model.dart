class IntroPageModel {
  String topTitle;
  String bottomTitle;
  String imagePath;
  bool hasBottomTitle;

  IntroPageModel({
    required this.topTitle,
    required this.bottomTitle,
    required this.imagePath,
    this.hasBottomTitle = true,
  });
}

final List<IntroPageModel> pages = [
  IntroPageModel(
    topTitle: "Welcome To Islmi App",
    bottomTitle: "",
    imagePath: "assets/images/intro1.png",
    hasBottomTitle: false,
  ),
  IntroPageModel(
    topTitle: "Welcome To Islami",
    bottomTitle: "We Are Very Excited To Have You In Our Community",
    imagePath: "assets/images/intro2.png",
  ),
  IntroPageModel(
    topTitle: "Reading the Quran",
    bottomTitle: "Read, and your Lord is the Most Generous",
    imagePath: "assets/images/intro3.png",
  ),
  IntroPageModel(
    topTitle: "Bearish",
    bottomTitle: "Praise the name of your Lord, the Most High",
    imagePath: "assets/images/intro4.png",
  ),
  IntroPageModel(
    topTitle: "Holy Quran Radio",
    bottomTitle:
        "You can listen to the Holy Quran Radio through the application for free and easily",
    imagePath: "assets/images/intro5.png",
  ),
];
