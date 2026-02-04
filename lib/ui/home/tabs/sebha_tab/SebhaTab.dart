import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:islami_c17/core/resources/AssetsManager.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int zikrIndex = 0;

  List<String> azkar = [
    "سبحان الله",
    "الحمد لله",
    "لا اله الا الله",
    "الله اكبر",
  ];
  double angle = 0;
  String nextZikr = ""@override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.sebha_bg),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Image.asset(AssetsManager.islamiHeader),
          ),

          Text(
            nextZikr,
            style: TextStyle(
              fontFamily: "Janna LT",
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 80),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: 120,
                top: -65,
                child: Image.asset(AssetsManager.sebha_part, width: 150),
              ),

              GestureDetector(
                onTap: () {
                  onSebhaTap();
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Transform.rotate(
                    angle: angle,
                    child: Image.asset(AssetsManager.sebha),
                  ),
                ),
              ),
              Positioned.fill(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        counter.toString(),
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text(
                        azkar[zikrIndex],
                        style: TextStyle(
                          fontFamily: "Janna LT",
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void onSebhaTap() {
    setState(() {
      angle -= math.pi / 24;

      counter++;

      if (counter == 34) {
        counter = 0;
        zikrIndex++;

        if (zikrIndex == azkar.length) {
          zikrIndex = 0;
        }
      }

      if (zikrIndex + 1 < azkar.length) {
        nextZikr = azkar[zikrIndex + 1];
      } else {
        nextZikr = azkar[0];
      }
    });
  }
}
