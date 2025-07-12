import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/roots.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/data/remote/auth/forgetpassword/verfiycode_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifycodeController extends GetxController {

  String? email;


   VerifyCodeRestPasswordData verifyCodeRestPasswordData=VerifyCodeRestPasswordData(Get.find());

   Statusrequest statusrequest=Statusrequest.none;


  goToResetPassword(verfiycode) async{
       statusrequest= Statusrequest.loading;
       update();
   var response =await verifyCodeRestPasswordData.addData(email!, verfiycode);
   statusrequest=handlingData(response);
   if(statusrequest == Statusrequest.success){
    if(response["status"]== "success"){
        Get.offNamed(AppRoutes.resetPassword,arguments: {
        "email":email
       });
    }else{
       Get.defaultDialog(title: "warning",middleText: "verfiycode not correct");
       statusrequest= Statusrequest.failure;
      
    }
   }

   update();
    
  }



  @override
  void onInit() {

email=  Get.arguments["email"];
    super.onInit();
  }

  @override
  void dispose() {


    super.dispose();
  }
}
