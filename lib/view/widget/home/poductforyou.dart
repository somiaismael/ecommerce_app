import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/data/model/items_model.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Poductforyou extends GetView<HomeController> {
  const Poductforyou({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
                    height: 200,

                    child: ListView.builder(
                      itemCount: controller.items.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,i)=> Items(itemsModel: ItemsModel.fromJson(controller.items[i]),)),
                  );
  }
}

class Items extends StatelessWidget {
  final ItemsModel itemsModel;
  const Items({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            height: 150,
                            width: 150,
                            padding: EdgeInsets.symmetric(vertical: 10),
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            child:Image.network("${AppLink.itemsRoot}/${itemsModel.itemsImage}",fit: BoxFit.fill,),
                          ),
                          Container(
                            height: 150,
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(20)
                            ),
                         
                          ),
                            Positioned(
                              top: 10,
                              left: 10,
                              child: Text("${itemsModel.itemsName}"  ,style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 15 ),)),
                        ],
                      );
  }
}