import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/controller/itemspage_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/functions/transelate_database.dart';
import 'package:ecommerce/data/model/categories_model.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ListCategoriesItems extends GetView<ItemspageController> {
  const ListCategoriesItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
                  width: 10,
                ),
            scrollDirection: Axis.horizontal,
            itemCount: controller.categories.length,
            itemBuilder: (context, index) => Categories(
                i: index,
                categoriesModel:
                    CategoriesModel.fromJson(controller.categories[index]))));
  }
}

class Categories extends GetView<ItemspageController> {
  final CategoriesModel categoriesModel;
  final int i;
  const Categories({
    super.key,
    required this.categoriesModel,
    required this.i,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changeCategory(i ,categoriesModel.categoriesId);
        // controller.goToItemsPage(controller.categories, selectedCat);
      },
      child: Column(
        children: [
          GetBuilder<ItemspageController>(
              builder: (controller) => Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      transelateDataBase(categoriesModel.categoriesNameAr!,categoriesModel.categoriesName!),
                      style: TextStyle(
                          color: controller.selectedCat == i
                              ? AppColor.primaryColor
                              : Colors.grey[800],
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                  ))
        ],
      ),
    );
  }
}
