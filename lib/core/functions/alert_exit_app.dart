import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp()async{
  Get.defaultDialog(
    title:'warning',
    middleText: 'do you want to leave?'.tr ,
    actions: [
      ElevatedButton(onPressed: (){
      exit(0);
      }, child: Text('yes'.tr)),
          ElevatedButton(onPressed: (){
    Get.back();
      }, child: Text('no'.tr)),
    ]
  );
 return Future.value(true);
}