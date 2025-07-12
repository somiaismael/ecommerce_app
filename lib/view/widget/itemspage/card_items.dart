import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/favorite_controller.dart';
import 'package:ecommerce/controller/itemspage_controller.dart';
import 'package:ecommerce/core/functions/transelate_database.dart';
import 'package:ecommerce/data/model/items_model.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardItems extends GetView<ItemspageController> {

 final ItemsModel itemsModel;
 final bool active;
  const CardItems( {super.key, required this.itemsModel,required this.active,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        controller.goToProductDetails(itemsModel);
      },
      child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(children: [
                    Hero(
                      tag: "${itemsModel.categoriesId}",
                      child: CachedNetworkImage(imageUrl: "${AppLink.itemsRoot}/${itemsModel.itemsImage}")),
                    Text("${transelateDataBase(itemsModel.itemsNameAr!, itemsModel.itemsName!)}",style: TextStyle(fontWeight: FontWeight.bold),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Text("${itemsModel.itemsPrice}\$",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                      SizedBox(height: 10,),
                    GetBuilder<FavoriteController>(builder: (controller)=>  IconButton(onPressed: (){
                      if(controller.favorite[itemsModel.itemsId]==  1 ){
                        controller.deletData(itemsModel.itemsId);
                        controller.setFavorite(itemsModel.itemsId, 0);
                    
                      }else{
                        controller.setFavorite(itemsModel.itemsId, 1);
                        controller.addData(itemsModel.itemsId);
                      }
                    }, icon: Icon(
                     controller.favorite[itemsModel.itemsId]==  1 ?Icons.favorite:
                        Icons.favorite_border_outlined,color: Colors.red)))
                      
                    ],)
                  ],),
                ),
              ),
    );
  }
}