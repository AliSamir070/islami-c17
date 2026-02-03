import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setOnboardingSeen() async {
    await prefs.setBool('onboarding_seen', true);
  }

  static bool isOnboardingSeen() {
    return prefs.getBool('onboarding_seen') ?? false;
  }
}
