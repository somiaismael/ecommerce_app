import 'package:ecommerce/controller/auth/forgetpassword/resetpassword_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/functions/valid_input.dart';
import 'package:ecommerce/view/widget/auth/auth_button.dart';
import 'package:ecommerce/view/widget/auth/auth_top_text.dart';
import 'package:ecommerce/view/widget/auth/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
     Get.put(ResetpasswordController());
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Reset Password")),),
      body: SafeArea(
        child: GetBuilder<ResetpasswordController>(builder: (controller)=>
        HandlingDataRequest(statusrequest: controller.statusrequest,
         widget: ListView(children: [
          Form(
            key: controller.formState,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30,horizontal: 30 ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AuthTopText(text: "New Password"),
                  
                  Text("please Enter Your Password",
                  textAlign: TextAlign.center,),
                  SizedBox(height: 30,),
                   TextformfieldAuth(
                           isObsecure: controller.isObsecure,
                          onTapIcon: controller.onTapTextFormIcon,
                          mycontroller: controller.password2,
                        validator: (p0) {
                        return  validInput(p0!, 30, 3, "password");
                        },label: 'Password', icon: Icons.lock),
                      TextformfieldAuth(
                           isObsecure: controller.isObsecure,
                          onTapIcon: controller.onTapTextFormIcon2,
                          mycontroller: controller.password1,
                        validator: (p0) {
                        return  validInput(p0!, 30, 3, "password");
                        },label: 'Password', icon: Icons.lock),
                 
                    SizedBox(height: 30,),
                  AuthButton(text: "Save", onPressed: (){
                    controller.goToSuccessResetPassword();
                  })
                ],
              ),
            ),
          )
        ],),))
      ),
    );
  }
}