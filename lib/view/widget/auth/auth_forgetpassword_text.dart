import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class AuthForgetpasswordText extends StatelessWidget {
final void Function() onTap;
  const AuthForgetpasswordText({super.key, required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap ,
      child: Text(
                            "Forget password?",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.bold,
                            )),
    );
  }
}