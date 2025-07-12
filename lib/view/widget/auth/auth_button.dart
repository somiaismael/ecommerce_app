import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Color? color;
  final void Function() onPressed;
  const AuthButton({super.key, required this.text, required this.onPressed,  this.color});

  @override
  Widget build(BuildContext context) {
    return  MaterialButton(onPressed: onPressed,
                         color: color==null? AppColor.secondColor:color,
                         padding: EdgeInsets.symmetric(horizontal: 120),
                         child: Text(text,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),);
  }
}