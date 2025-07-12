import 'package:ecommerce/controller/auth/signup_verifycode_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/auth/auth_button.dart';
import 'package:ecommerce/view/widget/auth/auth_top_text.dart';
import 'package:ecommerce/view/widget/auth/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class SignUpVerifycode extends StatelessWidget {
  const SignUpVerifycode({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpVerifycodeController());
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Sign Up Verifycode")),
      ),
      body: SafeArea(
          child: GetBuilder<SignUpVerifycodeController>(
        builder: (controller) => HandlingDataRequest(statusrequest: controller.statusrequest,
         widget: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AuthTopText(text: "Check Code"),
                  Text(
                    "please Enter Your verification code",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  OtpTextField(
                    numberOfFields: 5,
                    borderColor: AppColor.primaryColor,

                    showFieldAsBox: true,

                    onCodeChanged: (String code) {},

                    onSubmit: (String verfiycode) {
                      controller.goToSuccessSignUp(verfiycode);
                    }, // end onSubmit
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  AuthButton(
                      text: "Resend Code",
                      onPressed: () {
                        controller.resendCode();
                      })
                ],
              ),
            )
          ],
        ),)
      )),
    );
  }
}
