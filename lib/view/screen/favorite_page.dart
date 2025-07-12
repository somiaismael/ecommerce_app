
import 'package:ecommerce/controller/favorite_page_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/roots.dart';
import 'package:ecommerce/view/widget/appbar_home.dart';
import 'package:ecommerce/view/widget/favorite/card_favorite.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FavoritePageController());
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: const  EdgeInsets.symmetric(
            horizontal: 15,
          ),
        child: ListView(children: [
              // AppBarHome(title: "Find product",onPressedSearchIcon: () {},onSearch: (){},
              //   onPressedFavorite:(){ Get.toNamed(AppRoutes.favorite);},),

               GetBuilder<FavoritePageController>(builder: (controller)=> HandlingDataView(
                statusrequest: controller.statusrequest,
          widget: GridView.builder(
            itemCount: controller.data.length,
            gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio:0.8) ,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
           itemBuilder: (BuildContext context,index){
         
            return  CardFavorite(myFavoriteModel: controller.data[index],);
           }))
           )
        ],),
      )),
    );
  }
}