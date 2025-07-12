import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/roots.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/data/remote/auth/forgetpassword/resetpassword.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetpasswordController extends GetxController {
  late TextEditingController password1;
  late TextEditingController password2;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  ResetpasswordData resetpasswordData = ResetpasswordData(Get.find());
  bool isObsecure = true;
  bool isObsecure2 = true;
  String? email;

  Statusrequest statusrequest = Statusrequest.none;
  onTapTextFormIcon() {
    if (isObsecure == true) {
      isObsecure = false;
    } else {
      isObsecure = true;
    }
    update();
  }

    onTapTextFormIcon2() {
    if (isObsecure2 == true) {
      isObsecure2 = false;
    } else {
      isObsecure2 = true;
    }
    update();
  }

  goToSuccessResetPassword() async {
    if (password1.text != password2.text) {
     return Get.defaultDialog(title: "warning", middleText: "passwrd dosen't match");
    }

    if (formState.currentState!.validate()) {
      statusrequest = Statusrequest.loading;
      update();
      var response = await resetpasswordData.dataCheck(email!, password1.text);
      print("============================= controller $response");

      statusrequest = handlingData(response);
      if (Statusrequest.success == statusrequest) {
        if (response["status"] == "success") {
          Get.offNamed(AppRoutes.successresetPassword);
        } else {
          Get.defaultDialog(
              title: "warning", middleText: "Try Again");
          statusrequest = Statusrequest.failure;
        }
      }
      update();
    } else {
      print("Not Valid");
    }
  }

  @override
  void onInit() {
    password1 = TextEditingController();
    password2 = TextEditingController();
    email = Get.arguments["email"];
    super.onInit();
  }

  @override
  void dispose() {
    password1.dispose();
    password2.dispose();

    super.dispose();
  }
}
