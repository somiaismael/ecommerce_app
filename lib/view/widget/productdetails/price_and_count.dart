import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class PriceAndCount extends StatelessWidget {
  final String price;
  final int count;
  final void Function()? add;
  final void Function()? remove;
  const PriceAndCount({super.key, required this.price,required this.add,required this.remove, required this.count,});

  @override
  Widget build(BuildContext context) {
    return   Row(
                  children: [
                    Row(
                      children: [
                               IconButton(onPressed: add, icon: Icon(Icons.add)),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                  decoration: BoxDecoration(border: Border.all()),
                                  child: Text(  "$count"   )),
                               IconButton(onPressed: remove, icon: Icon(Icons.remove)),
                      ],
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          "Price",
                          style: TextStyle(
                              color: AppColor.darkBrown,
                              fontWeight: FontWeight.w900,
                              fontSize: 25),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          price,
                          style: TextStyle(
                          
                              color: Colors.red,
                              fontWeight: FontWeight.w900,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                );
  }
}