import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/roots.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/data/remote/auth/forgetpassword/checkemail_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Forgetpasswordcontroller extends GetxController {

  late TextEditingController email;
GlobalKey<FormState> formState=GlobalKey<FormState>();


   CheckEmailData checkEmailData=CheckEmailData(Get.find());


   Statusrequest statusrequest=Statusrequest.none;

  goToVerifycode() async{
     if(formState.currentState!.validate()){
      statusrequest = Statusrequest.loading;
      update();
    var response= await checkEmailData.dataCheck(email.text);
    print("============================= controller $response");

    statusrequest=handlingData(response);
     if(Statusrequest.success == statusrequest){

      if(response["status"]== "success"){
       Get.offNamed(AppRoutes.verifycode,arguments: {
        "email":email.text
       });

      }else{
        Get.defaultDialog(title: "warning",middleText: "email is not correct");
        statusrequest= Statusrequest.failure;
      
     }

     }
         update();
    
    }
 
    
  }



  @override
  void onInit() {

    email = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {

    email.dispose();

    super.dispose();
  }
}
