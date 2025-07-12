import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class AuthTopText extends StatelessWidget {
  final String text;
  const AuthTopText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return     Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: Text(
                              text,
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: AppColor.primaryColor,
                                
                              ),
                            ),
    );
  }
}