import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingData {
 final  String title;
 final String body;
 final String image;

  OnboardingData({required this.title,required this.body,required this.image,});
}

List<OnboardingData>  onboardingData=[
  OnboardingData(title:"4".tr ,
  body:"5".tr ,
  image:"assetes/image/7.png" ),

  OnboardingData(title:"6".tr ,
  body:"7".tr ,
  image:"assetes/image/6.png" ),

  OnboardingData(title:"8".tr ,
  body:"9".tr ,
  image:"assetes/image/8.png" ),
];