import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class HaveAnAccount extends StatelessWidget {
  final void Function()? onTap;
  const HaveAnAccount({super.key,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return   Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                "have an account? ",
                                style: TextStyle(
                                  color: Colors.black,
                                 
                                ),
                              ),
                               InkWell(
                                onTap:onTap,
                                 child: Text(
                                  "Login",
                                  style: TextStyle(
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.bold
                                  ),
                                                               ),
                               ),
                          ],
                        );
  }
}