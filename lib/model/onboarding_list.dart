import 'package:islami_c17/core/resources/AssetsManager.dart';
import 'package:islami_c17/core/resources/StringsManager.dart';
import 'package:islami_c17/model/onboarding_model.dart';

class OnboardingList {
  static List<OnboardingModel> boadrdingList=[
    OnboardingModel(imagePath:AssetsManager.mrhbn , header: StringsManager.WelcomeHeaderApp),
    OnboardingModel(imagePath: AssetsManager.msjd,header: StringsManager.Welcome,Text: StringsManager.WelcomeText),
    OnboardingModel(imagePath: AssetsManager.mshf,header: StringsManager.readHeader,Text: StringsManager.readText),
    OnboardingModel(imagePath: AssetsManager.sbha,header: StringsManager.sbhaHeader,Text: StringsManager.sbhaText),
    OnboardingModel(imagePath: AssetsManager.mic,header: StringsManager.radioHeader,Text: StringsManager.radioText),
  ];
}