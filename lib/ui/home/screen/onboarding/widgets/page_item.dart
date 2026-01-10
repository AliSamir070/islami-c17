import 'package:flutter/material.dart';
import 'package:islami_c17/core/resources/ColorsManager.dart';
import '../../../../../model/intro_page_model.dart';

class PageItem extends StatelessWidget {
  final IntroPageModel model;
  const PageItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(model.imagePath, height: 0.35 * height),

        const SizedBox(height: 24),

        Text(
          model.topTitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            fontFamily: "Janna LT",
            color: ColorsManager.primaryColor,
          ),
        ),

        if (model.hasBottomTitle) ...[
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              model.bottomTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontFamily: "Janna LT",
                color: ColorsManager.primaryColor,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
