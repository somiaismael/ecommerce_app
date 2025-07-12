import 'package:ecommerce/controller/auth/forgetpassword/forgetpasswordcontroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/functions/valid_input.dart';
import 'package:ecommerce/view/widget/auth/auth_button.dart';
import 'package:ecommerce/view/widget/auth/auth_top_text.dart';
import 'package:ecommerce/view/widget/auth/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Forgetpasswordcontroller());
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Forget Password")),),
      body: SafeArea(
        child: GetBuilder< Forgetpasswordcontroller>(builder: (controller)=>
        HandlingDataRequest(
          statusrequest: controller.statusrequest,
         widget: ListView(children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30,horizontal: 30 ),
              child: Form(
                   key: controller.formState,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AuthTopText(text: "Check Email"),
                    
                    Text("please Enter Your Email Address To Recive A verification code",
                    textAlign: TextAlign.center,),
                    SizedBox(height: 30,),
                    TextformfieldAuth(mycontroller: controller.email,label: "Email",
                          validator: (p0) {
                          return  validInput(p0!, 40, 3, "email");
                          },icon: Icons.email),
                      SizedBox(height: 30,),
                    AuthButton(text: "Check", onPressed: (){controller.goToVerifycode(
                      
                    );})
                  ],
                ),
              ),
            )
          ],),))
       
      ),
    );
  }
}