import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomMaterialButtom extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final IconData? iconData;
  final bool? isSelected;
 
  const CustomMaterialButtom(
      {super.key, this.onPressed, required this.text, this.iconData,  this.isSelected});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [Icon(iconData,color:isSelected==true ?AppColor.primaryColor:Colors.grey[800] ,), 
        Text(text,style: TextStyle(color: isSelected==true ?AppColor.primaryColor:Colors.grey[800]),)],
      ),
    );
  }
}
