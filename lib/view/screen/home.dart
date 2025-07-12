import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/roots.dart';
import 'package:ecommerce/data/model/items_model.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:ecommerce/view/widget/appbar_home.dart';
import 'package:ecommerce/view/widget/home/categories_list.dart';
import 'package:ecommerce/view/widget/home/home_card.dart';
import 'package:ecommerce/view/widget/home/poductforyou.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    
    Get.put(HomeController());
    return Scaffold(
    
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: GetBuilder<HomeController>(builder: (controller)=>ListView(
            children: [
              AppBarHome(title: "Find product",
               onChanged: (String val) { 
                  controller.onSearchChanged(val);
                 },onPressedSearchIcon: () {
                controller.onSearchIconTap();
              },
              onPressedFavorite:(){ Get.toNamed(AppRoutes.favorite);},
               mycontroller: controller.search,
               )
             ,HandlingDataView(statusrequest: controller.statusrequest,
              widget: !controller.isSearch? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 HomeCard(title: "Summer Offers",body: "cash back 50%",),
                 SizedBox(width: 10,),
                 Padding(
                  
                   padding: const EdgeInsets.only(left:25 ),
                   child: CategoriesList(),
                 ),
                  SizedBox(height: 10,),
                  Text("Products For You",style: TextStyle(color: AppColor.primaryColor,fontSize: 20,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                Poductforyou()
               ],
             ):SearchItemsList(listdata: controller.searchItemsList,),)
         
             
              
            ],
          ),)
        ),
      ),
    );
  }
}


class SearchItemsList extends StatelessWidget {
 final List<ItemsModel>  listdata;
  const SearchItemsList({super.key, required this.listdata});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:listdata.length ,
      shrinkWrap: true,
      physics:NeverScrollableScrollPhysics() ,
      itemBuilder: (context, index) => 
      Padding(
        padding: const EdgeInsets.symmetric(horizontal:  8.0),
        child: Card(child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: CachedNetworkImage(imageUrl: "${AppLink.itemsRoot}/${listdata[index].itemsImage}")),
              Expanded(
                flex: 2,
                child: ListTile(title: Text("${listdata[index].itemsName}") 
                ,subtitle:   Text("${listdata[index].itemsPrice}\$",
                style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),)),
            ],
          ),
        )
         ),
      ),
    );
  }
}