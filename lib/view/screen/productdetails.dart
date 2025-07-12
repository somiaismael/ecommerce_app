import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/product_details_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/roots.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:ecommerce/view/widget/productdetails/bottm_navigation_productdetails.dart';
import 'package:ecommerce/view/widget/productdetails/price_and_count.dart';
import 'package:ecommerce/view/widget/productdetails/productdetails_Image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailsController controller = Get.put(ProductDetailsController());
    return Scaffold(
      bottomNavigationBar: BottmNavigationProductDetails(onPressed: () {
      
        Get.toNamed(AppRoutes.cart);
      },),
      body: SafeArea(
          child: ListView(
        children: [
    ProductdetailsImage(),
          SizedBox(
            height: 159,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               
                Text(
                  "${controller.itemsModel!.itemsName}",
                  style: TextStyle(
                      color: AppColor.darkBrown,
                      fontWeight: FontWeight.w900,
                      fontSize: 25),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${controller.itemsModel!.itemsDec}",
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
                SizedBox(
                  height: 20,
                ),
              GetBuilder<ProductDetailsController>(builder: (controller)=>  PriceAndCount(
                  price: "${controller.itemsModel!.itemsPrice}\$",
                  count:controller.countItems,
                  add: () {controller.add();},
                  remove: () {controller.remove();},
                ))
              ],
            ),
          )
        ],
      )),
    );
  }
}
