import 'package:flutter/material.dart';

class SignUpTopText extends StatelessWidget {
  const SignUpTopText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
                      'SignUp',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    );
  }
}