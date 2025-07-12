import 'package:ecommerce/view/screen/home.dart';
import 'package:ecommerce/view/screen/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
 int currentPage=0;
 bool active=true;
 List<Widget> listpages=[
  Home(),
  Column(
    
    mainAxisAlignment: MainAxisAlignment.center,
    children: [Container(
      width: double.infinity,
      child: Text("favourite"))],
  ),
    Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [Container(      width: double.infinity,child: Text("profile"))],
  ),
    Settings()
 ];

 List bottomnavigationtitle=[
  {"title" : "Home","icon":Icons.home},
   {"title" : "favourite","icon":Icons.favorite},
    {"title" : "profile","icon":Icons.person},
     {"title" :  "settings","icon":Icons.settings},
 ];
 
 changePage(int i){
  currentPage=i;
  update();

 }
}