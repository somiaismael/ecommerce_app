import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/view/widget/auth/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationBarCart extends StatelessWidget {
  const BottomNavigationBarCart({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<CartController>(builder: (controller)=>Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:  20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Price",
                    style: TextStyle(
                      fontSize: 18,
                      
                    ),
                  ),
                  Text(
                    "${controller.totalItemsPrice}\$",
                    style: TextStyle(
                        color: Colors.red,
                        // height: 5,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ), Padding(
              padding: const EdgeInsets.symmetric(horizontal:  20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Shipping",
                    style: TextStyle(
                      fontSize: 18,
                    
                    ),
                  ),
                  Text(
                    "50\$",
                    style: TextStyle(
                        color: Colors.red,
                        // height: 5,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Divider(),
            ),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal:  20.0),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Price",
                    style: TextStyle(
                      fontSize: 20,
                       fontWeight: FontWeight.w700
                    ),
                  ),
                  Text(
                   "${controller.totalItemsPrice}\$",
                    style: TextStyle(
                        color: Colors.red,
                        // height: 5,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ],
                           ),
             ),
            AuthButton(text: "Check", onPressed: () {}),
          ],
        
      ));
  }
}