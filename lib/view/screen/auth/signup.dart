
import 'package:ecommerce/controller/auth/signup_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/functions/alert_exit_app.dart';
import 'package:ecommerce/core/functions/valid_input.dart';
import 'package:ecommerce/view/widget/auth/auth_button.dart';
import 'package:ecommerce/view/widget/auth/auth_top_text.dart';
import 'package:ecommerce/view/widget/auth/auth_waveclipper.dart';
import 'package:ecommerce/view/widget/auth/textformfield.dart';
import 'package:ecommerce/view/widget/signup/have_an_account.dart';
import 'package:ecommerce/view/widget/signup/signuptoptext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});
  @override
  Widget build(BuildContext context) {
    SignUpController controller=Get.put(SignUpController()) ;
    return Scaffold(
      body: PopScope( canPop:false,
          onPopInvoked:(didPop) {
            if(didPop){
              return;
            }else{
              alertExitApp();
            }
          },child:HandlingDataRequest(statusrequest: controller.statusrequest,
           widget:  GetBuilder<SignUpController>(builder: (controller)=>ListView(
        children: [
          Form(
            key: controller.formState,
            child: Stack(
              children: [
                Icon(Icons.arrow_back,color: Colors.white,),
                ClipPath(
                  clipper: WaveClipper(),
                  child: Container(
                    height: 250,
                    color: AppColor.primaryColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 90),
                  child: Center(
                    child: SignUpTopText(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 250),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Column(
                      children: [
                        AuthTopText(
                          text: 'Hey,Welcome!',
                        ),
                        TextformfieldAuth(
                          mycontroller: controller.username,
                        validator: (p0) {
                        return  validInput(p0!, 20, 3, "username");
                        },
                          label: 'Username', icon: Icons.person),
                        TextformfieldAuth(mycontroller: controller.email,
                        validator: (p0) {
                        return  validInput(p0!, 40, 5, "email");
                        },label: 'Email', icon: Icons.email),
                        TextformfieldAuth(
                          isNumber: true,
                          mycontroller: controller.phone,
                        validator: (p0) {
                        return  validInput(p0!, 11, 7, "phone");
                        },label: 'Phone', icon: Icons.phone),
                        TextformfieldAuth(
                           isObsecure: controller.isObsecure,
                          onTapIcon: controller.onTapTextFormIcon,
                          mycontroller: controller.password,
                        validator: (p0) {
                        return  validInput(p0!, 30, 3, "password");
                        },label: 'Password', icon: Icons.lock),
                 
                   
                        SizedBox(height: 60),
                        AuthButton(
                          onPressed: () {
                            controller.signUp();
                          },
                          text: "Sign Up",
                        ),
                        // SizedBox(height: 10),
                      HaveAnAccount(onTap:  () {
                                  controller.goToLogin();
                                },)
                  
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),)))
    );
  }
}
