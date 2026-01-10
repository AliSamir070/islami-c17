import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../../../core/resources/AssetsManager.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  List<String> azkar = ["سبحان الله", "الحمدلله", "الله اكبر"];
  int count = 33;
  int currentAzkarIndex = 0;
  double angle = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.sebhaBackground),
          fit: BoxFit.fill,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Image.asset(
              AssetsManager.islamiHeader,
              height: 0.16 * height,
              fit: BoxFit.fitHeight,
            ),
            const SizedBox(height: 20),
            const Text(
              "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
              style: TextStyle(
                fontFamily: "Janna LT",
                fontWeight: FontWeight.w700,
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: onTapSebha,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 45),
                    child: Image.asset(
                      AssetsManager.mask,
                      height: 0.1 * height,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 0.09 * height),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Transform.rotate(
                          angle: angle,
                          child: Image.asset(
                            AssetsManager.sebhaBody,
                            height: 0.4 * height,
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              azkar[currentAzkarIndex],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontFamily: "Janna LT",
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: 32,
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              count.toString(),
                              style: const TextStyle(
                                fontFamily: "Janna LT",
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: 36,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  void onTapSebha() {
    setState(() {
      count--;
      angle -= math.pi / 24;

      if (count == 0) {
        count = 33;
        currentAzkarIndex = (currentAzkarIndex + 1) % azkar.length;
      }
    });
  }
}