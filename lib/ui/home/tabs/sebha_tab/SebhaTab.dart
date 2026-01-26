import 'package:flutter/material.dart';
import 'package:islami_c17/core/resources/AssetsManager.dart';
import 'package:islami_c17/core/resources/StringsManager.dart';

import '../../../../core/resources/ColorsManager.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int count = 0;
  int tsbih = 0;
  double rotate=0;
  List<String> Tsbih = [
    "سبحان الله",
    "الحمدالله",
    "الله كبر",
    "أستغفر الله",
    "لا اله الا الله",
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorsManager.secondaryColor,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(AssetsManager.sbha_background),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              Image.asset(
                AssetsManager.islamiHeader,
                width: width * 0.75,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(height: 16),
              Text(
                StringsManager.sbhaheadText,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16),
              Stack(
                alignment: Alignment.center,
                children: [
                  Transform.rotate(
                    angle: rotate,
                    child: Image.asset(AssetsManager.sbha_rottute),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        count += 1;
                        rotate+=0.203;
                      });
                      if (count == 31) {
                        count = 0;
                        if (tsbih != 4) {
                          tsbih += 1;
                        } else if (tsbih == 4) {
                          tsbih = 0;
                        }
                      }
                    },
                    child: Text(
                      "${Tsbih[tsbih]}\n${count}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
