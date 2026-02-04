import 'package:flutter/material.dart';
import 'package:islami_c17/ui/hadeht_details/screen/hadeth_details_screen.dart';
import 'package:islami_c17/ui/home/screen/home_screen.dart';
import 'package:islami_c17/ui/onboarding/onboarding.dart';
import 'package:islami_c17/ui/sura_details/screen/sura_details_screen.dart';

import 'core/cache/shared_prefs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs.init();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: SharedPrefs.isOnboardingSeen()
          ? HomeScreen.routeName
          : Onboarding.routeName,
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName:(_)=>HomeScreen(),
        SuraDetailsScreen.routeName:(_)=>SuraDetailsScreen(),
        HadethDetailsScreen.routeName: (_) => HadethDetailsScreen(),
        Onboarding.routeName: (_) => Onboarding()
      },
    );
  }
}
