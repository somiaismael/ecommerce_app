import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/roots.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/data/remote/auth/sign_up_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  late TextEditingController username;
  late TextEditingController email;
    late TextEditingController phone;
  late TextEditingController password;
GlobalKey<FormState> formState=GlobalKey<FormState>();
 bool isObsecure=true;

   SignUpData signUpData=SignUpData(Get.find());


   Statusrequest statusrequest=Statusrequest.none;

  onTapTextFormIcon(){
    if(isObsecure == true){
      isObsecure=false;
    }else{
      isObsecure=true;
    }
    update();
  }

  signUp() async{

    if(formState.currentState!.validate()){
      statusrequest = Statusrequest.loading;
      update();
    var response= await signUpData.addData(username.text,password.text,email.text,phone.text);
    print("============================= controller $response");

    statusrequest=handlingData(response);
     if(Statusrequest.success == statusrequest){

      if(response["status"]== "success"){
       Get.offNamed(AppRoutes.verifycodeSignUp,arguments: {
        "email":email.text
       });

      }else{
        Get.defaultDialog(title: "warning",middleText: "phone or email oready exist");
      statusrequest= Statusrequest.failure;
     }

     }
         update();
    
    }
  }

  goToLogin(){
    Get.offNamed(AppRoutes.login);
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
     phone = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
     phone.dispose();
    password.dispose();
    super.dispose();
  }
}
