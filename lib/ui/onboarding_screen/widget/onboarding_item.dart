import 'package:flutter/material.dart';
import 'package:islami_c17/core/resources/AssetsManager.dart';
import 'package:islami_c17/core/resources/ColorsManager.dart';
import 'package:islami_c17/model/onboarding_model.dart';

class OnboardingItem extends StatelessWidget {
  OnboardingModel model;
  OnboardingItem(this.model);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Image.asset(model.imagePath),
          SizedBox(height: 39,),
          Text(model.header,style: TextStyle(color: ColorsManager.primaryColor,fontSize: 24,fontWeight: FontWeight.bold),),
          SizedBox(height: 29,),
          Text(model.Text,style: TextStyle(color: ColorsManager.primaryColor,fontSize: 17,fontWeight: FontWeight.w700),)
        ],
      ),
    );
  }
}
