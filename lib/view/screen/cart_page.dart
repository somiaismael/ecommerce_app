import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageassets.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:ecommerce/view/widget/auth/auth_button.dart';
import 'package:ecommerce/view/widget/cart/bottom_navigation_bar.dart';
import 'package:ecommerce/view/widget/cart/card_Products.dart';
import 'package:ecommerce/view/widget/homescreen/bottomnavigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
   CartController controller= Get.put(CartController());
    return Scaffold(
      bottomNavigationBar: BottomNavigationBarCart(),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: AppColor.primaryColor,
            )),
        title: Center(
          child: Text(
            "Cart",
            style: TextStyle(
                color: AppColor.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 30),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: 
        GetBuilder<CartController>(builder: (controller)=>
        HandlingDataView(
          statusrequest:controller.statusrequest, 
          widget:
           ListView(
          children: [
            ...List.generate(
              controller.data.length, (index)=>
             cardProducts(imageName: controller.data[index].itemsImage!,
             onAdd:()async{
           await   controller.addToCartData(controller.data[index].itemsId);
              controller.refreshCartPage();
              
             } ,
             onRemove:()async{ 
          await    controller.deletFromCartData( controller.data[index].itemsId);
                  controller.refreshCartPage();
              } ,
             productCount:"${controller.data[index].itemscount}" ,
             productName:controller.data[index].itemsName! ,
             productPrice:"${controller.data[index].itemsPrice!}"
             
              ,))
          ],
        ),
        )
        )
      ),
    );
  }
}
