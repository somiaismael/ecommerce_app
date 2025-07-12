import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/functions/transelate_database.dart';
import 'package:ecommerce/data/model/categories_model.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CategoriesList extends GetView<HomeController> {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
                    height: 100,
                    child: ListView.separated(
                      separatorBuilder: (context,index)=>SizedBox(width: 10,),
                      scrollDirection: Axis.horizontal,
                       itemCount: controller.categories.length,
                      itemBuilder: (context,index)=> Categories(
                        selectedCat: index,
                        categoriesModel: CategoriesModel.fromJson(controller.categories[index])) )
                  );
  }
}


class Categories extends GetView<HomeController> {
  final CategoriesModel categoriesModel;
  final int selectedCat;
  const Categories( {super.key, required this.categoriesModel,required this.selectedCat,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        controller.goToItemsPage(controller.categories, selectedCat,categoriesModel.categoriesId!);
      },
      child: Column(
                          children: [
                            Container(
                              
                              padding: EdgeInsets.symmetric(horizontal: 13,vertical: 10),
                              height: 70,
                              width: 70,
                                      decoration: BoxDecoration(
                            color: AppColor.lightBrown,
                            borderRadius: BorderRadius.circular(30)
                                                ),
                                                child:SvgPicture.network("${AppLink.categoiesRoot}/${categoriesModel.categoriesImage}",color: AppColor.darkBrown,),
                              
                                                 
                                              
                            ),
                                 Text(transelateDataBase(categoriesModel.categoriesNameAr!,categoriesModel.categoriesName!),
                                 style: TextStyle(color:AppColor.primaryColor,fontWeight: FontWeight.w700,fontSize: 12 ),)
                          ],
                        ),
    );
  }
}  