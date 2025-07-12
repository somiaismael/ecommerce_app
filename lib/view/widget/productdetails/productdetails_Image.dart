import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/product_details_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductdetailsImage extends GetView<ProductDetailsController> {
  const ProductdetailsImage({super.key});

  @override
  Widget build(BuildContext context) {
    return        Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
              ),
              Positioned(
                top: 50,
                right: Get.width / 8,
                left: Get.width / 8,
                child: Hero(
                    tag: "${controller.itemsModel!.categoriesId}",
                    child: CachedNetworkImage(
                      imageUrl:
                          "${AppLink.itemsRoot}/${controller.itemsModel!.itemsImage}",
                      height: 250,
                      fit: BoxFit.fill,
                    )),
              )
            ],
          );
  }
}