import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/favorite_controller.dart';
import 'package:ecommerce/controller/itemspage_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/roots.dart';
import 'package:ecommerce/data/model/items_model.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:ecommerce/view/widget/appbar_home.dart';
import 'package:ecommerce/view/widget/itemspage/card_items.dart';
import 'package:ecommerce/view/widget/itemspage/listcategoriesitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
  ItemspageController itemsController=Get.put(ItemspageController());
  FavoriteController controllerfav= Get.put(FavoriteController());
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 15,
          ),
        child: ListView(
          children: [
             AppBarHome(title: "Find product",
               onChanged: (String val) { 
                  itemsController.onSearchChanged(val);
                 },onPressedSearchIcon: () {
                itemsController.onSearchIconTap();
              },
              onPressedFavorite:(){ Get.toNamed(AppRoutes.favorite);},
               mycontroller: itemsController.search,
               ),
            ListCategoriesItems(),
       GetBuilder<ItemspageController>(builder: (controller)=> HandlingDataView(statusrequest: controller.statusrequest,
          widget: GridView.builder(
            itemCount: controller.data.length,
            gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio:0.8) ,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
           itemBuilder: (BuildContext context,index){
            controllerfav.favorite[controller.data[index]["items_id"]]=controller.data[index]["favorite"];
            return  CardItems(
              active: true,
              itemsModel: ItemsModel.fromJson(controller.data[index]));

           }))
           )
          ],
        ),
      )),
    );
  }
}