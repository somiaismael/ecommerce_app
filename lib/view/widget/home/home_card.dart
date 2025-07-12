import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final String title;
   final String body;
  const HomeCard({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Stack(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 160,
                        decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            borderRadius: BorderRadius.circular(20)),
                            child: ListTile(
                            title: Text(title,style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w600),),
                            subtitle:Text(body,style: TextStyle(color: Colors.white,fontSize:20,)) ,),
                      ),
                     Positioned(
                      top: -30,
                      right: -40,
                      child: 
                      Container(height: 160,width: 160,decoration: BoxDecoration(
                        color: AppColor.lightBrown
                        ,borderRadius: BorderRadius.circular(100)
                      ),)
                      )
                    ],
                             
                ),
              );
  }
}