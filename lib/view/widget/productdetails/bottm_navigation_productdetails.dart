import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class BottmNavigationProductDetails extends StatelessWidget {
  final void Function()? onPressed;
  const BottmNavigationProductDetails({super.key,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: AppColor.primaryColor,
          onPressed: onPressed,
          child: Text(
            "GO To Cart",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
      );
  }
}