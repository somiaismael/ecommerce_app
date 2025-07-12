import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class TextformfieldAuth extends StatelessWidget {
  final String label;
  final TextEditingController? mycontroller;
  final IconData icon;
  final String? Function(String?) validator;
  final bool? isNumber;
  final bool? isObsecure;
  final void Function()? onTapIcon;
  const TextformfieldAuth(
      {super.key,
      required this.label,
      // required
      this.mycontroller,
      required this.icon,
      required this.validator,
      this.isNumber,
      this.isObsecure,
      this.onTapIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: TextFormField(
        obscureText: isObsecure == true ? true : false,
        keyboardType:
            isNumber == true ? TextInputType.number : TextInputType.text,
        controller: mycontroller,
        validator: validator,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          labelText: label,
          labelStyle: TextStyle(
            fontSize: 12,
            color: Colors.grey[850],
          ),
          prefixIcon: InkWell(
            onTap: onTapIcon,
            child: Icon(
              icon,
              size: 20,
              color: Colors.grey[600],
            ),
          ),
          focusColor: AppColor.primaryColor,
        ),
      ),
    );
  }
}
