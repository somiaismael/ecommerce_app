import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/roots.dart';
import 'package:ecommerce/view/widget/auth/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessSignup extends StatelessWidget {
  const SuccessSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Congratulations")),),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 50,),
          child: Column(children: [
            Text("successfully registered" ,style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryColor,
                    ),),
                    SizedBox(height: 35,),
            Icon(Icons.check_circle_outline_rounded,size: 200,color: AppColor.lightBrown,),
               Text("Account successfully created" ,style: TextStyle(
                      fontSize: 20,
                      
                      fontWeight: FontWeight.bold,
                    ),),
                     SizedBox(height: 80,),
            AuthButton(text: "Go To Login",color: AppColor.primaryColor ,onPressed: (){
              Get.offAllNamed(AppRoutes.login);
            })
          ],),
        ),
      ),
    );
  }
}