import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/roots.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/remote/auth/login_data.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {

  late TextEditingController email;
  late TextEditingController password;
  GlobalKey<FormState> formState=GlobalKey<FormState>();
     LoginData loginData=LoginData(Get.find());


  List data=[];

   Statusrequest statusrequest=Statusrequest.none;
  MyServices myServices=Get.find();

  bool isObsecure=true;

  onTapTextFormIcon(){
    if(isObsecure == true){
      isObsecure=false;
    }else{
      isObsecure=true;
    }
    update();
  }

  goToSignUp(){
    
    Get.toNamed(AppRoutes.signup);
  }

   goToForgetPassword(){
    Get.toNamed(AppRoutes.forgetpassword);
  }

logIn() async{
     if(formState.currentState!.validate()){
      statusrequest = Statusrequest.loading;
      update();
    var response= await loginData.addData(email.text,password.text);
    print("============================= controller $response");

    statusrequest=handlingData(response);
     if(Statusrequest.success == statusrequest){

      if(response["status"]== "success"){
        if(response['data']['users_approve'] == 1){
            myServices.sharedPreferences.setInt("id", response['data']['users_id']);
            myServices.sharedPreferences
                .setString("username", response['data']['users_name']);
            myServices.sharedPreferences
                .setString("email", response['data']['users_email']);
            myServices.sharedPreferences
                .setString("phone", response['data']['users_phone']);
            myServices.sharedPreferences.setString("step", "2");

          
            
            Get.offNamed(AppRoutes.home);
        }else{
          Get.toNamed(AppRoutes.verifycodeSignUp,arguments: {
           "email":email.text
         });
        }
       

      }else{
        Get.defaultDialog(title: "warning",middleText: "password or email not valid");
        statusrequest= Statusrequest.failure;
      
     }

     }
         update();
    
    }
    
  }
  @override
  void onInit() {
        // FirebaseMessaging.instance.getToken().then((value){
        //   print(value);
        //   String? token =value;
        // });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {

    email.dispose();
    password.dispose();
    super.dispose();
  }
}
