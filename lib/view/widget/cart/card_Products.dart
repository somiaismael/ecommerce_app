import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:flutter/material.dart';

class cardProducts extends StatelessWidget {
  final String imageName;
  final String productName;
  final String productPrice;
  final String productCount;
  final void Function()? onAdd;
  final void Function()? onRemove;
  const cardProducts({super.key, required this.imageName, required this.productName, required this.productPrice,
  required this.onAdd,
   required this.onRemove, required this.productCount});

  @override
  Widget build(BuildContext context) {
    return Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                child: Container(
                  //   padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: CachedNetworkImage(
                            imageUrl:"${AppLink.itemsRoot}/${imageName}",
                            height: 115,
                            width: 90,
                            fit: BoxFit.cover,
                          )),
                      Expanded(
                          flex: 3,
                          child: ListTile(
                            title: Text(
                              productName,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              productPrice,
                              style: TextStyle(
                                  color: Colors.red,
                                  // height: 5,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                      Expanded(
                          child: Column(
                        children: [
                          IconButton(onPressed: onAdd, icon: Icon(Icons.add)),
                          Text("${productCount}"),
                          IconButton(
                              onPressed: onRemove, icon: Icon(Icons.remove)),
                        ],
                      )),
                    ],
                  ),
                ),
              ),
            );
  }
}