import 'package:ecommerce/controller/auth/signin_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/functions/alert_exit_app.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/functions/valid_input.dart';
import 'package:ecommerce/view/widget/auth/auth_button.dart';
import 'package:ecommerce/view/widget/auth/auth_donthaveaccount.dart';
import 'package:ecommerce/view/widget/auth/auth_forgetpassword_text.dart';
import 'package:ecommerce/view/widget/auth/auth_top_text.dart';
import 'package:ecommerce/view/widget/auth/auth_waveclipper.dart';
import 'package:ecommerce/view/widget/auth/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});
  @override
  Widget build(BuildContext context) {
  Get.put(SigninController()) ;
    return Scaffold(
      body: PopScope(
           canPop:false,
          onPopInvoked:(didPop) {
            if(didPop){
              return;
            }else{
              alertExitApp();
            }
          },
        child: GetBuilder<SigninController>(builder:(controller)=>HandlingDataRequest(
          statusrequest: controller.statusrequest ,
           widget: ListView(
        children: [
          Form(
            key: controller.formState,
            child: Stack(
              children: [
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
                    child: Text(
                      'Login',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 250),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 20),
                    child: Column(
                      children: [
                        AuthTopText(
                          text: 'Welcome Back',
                        ),
                    
                        TextformfieldAuth(mycontroller: controller.email,
                        validator: (p0) {
                        return  validInput(p0!, 40,3, "email");
                        },
                        label: 'Email', icon: Icons.email),
                        TextformfieldAuth(
                          isObsecure: controller.isObsecure,
                          onTapIcon: controller.onTapTextFormIcon,
                          mycontroller: controller.password ,validator: (p0) {
                        return  validInput(p0!, 30, 3, "password");
                        },label: 'Password', icon: Icons.lock),
                        SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          child: 
                         AuthForgetpasswordText(onTap: () =>controller.goToForgetPassword() ,) ,
                        ),
                        SizedBox(height: 70),
                        AuthButton(
                          onPressed: () {
                            controller..logIn();
                          },
                          text: "Login",
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           AuthDonthaveaccount() ,
                            InkWell(
                              onTap: () => controller.goToSignUp(),
                              child: Text(
                                " Sign Up",
                                style: TextStyle(
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),) ))
    );
  }
}
