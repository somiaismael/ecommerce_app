import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LanguageButton extends StatelessWidget {
  final String text;
  final  void Function()? onPressed;
  const LanguageButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  MaterialButton(onPressed: onPressed,
          color: AppColor.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
          ),
          child: Text(text ,style: TextStyle(color: Colors.white),),
          );
  }
}