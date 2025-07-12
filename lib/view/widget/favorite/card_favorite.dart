import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/favorite_controller.dart';
import 'package:ecommerce/controller/favorite_page_controller.dart';
import 'package:ecommerce/controller/itemspage_controller.dart';
import 'package:ecommerce/core/functions/transelate_database.dart';
import 'package:ecommerce/data/model/items_model.dart';
import 'package:ecommerce/data/model/myfavorite_model.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardFavorite extends GetView<FavoritePageController> {
  final MyFavoriteModel myFavoriteModel;
 
  const CardFavorite({
    super.key,
    required this.myFavoriteModel,
   
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // controller.goToProductDetails();
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Hero(
                  tag: "${myFavoriteModel.itemsCat}",
                  child: CachedNetworkImage(
                      imageUrl:
                          "${AppLink.itemsRoot}/${myFavoriteModel.itemsImage}")),
              Text(
                "${transelateDataBase(myFavoriteModel.itemsNameAr!, myFavoriteModel.itemsName!)}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${myFavoriteModel.itemsPrice}\$",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  IconButton(
                      onPressed: () {
                        controller.deletData(myFavoriteModel.favoriteId);
                      },
                      icon: Icon(Icons.delete, color: Colors.red))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
