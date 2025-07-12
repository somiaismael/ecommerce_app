import 'package:ecommerce/controller/search_controller.dart';
import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/roots.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/model/items_model.dart';
import 'package:ecommerce/data/remote/home_data.dart';
import 'package:ecommerce/data/remote/search.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends SearchController {

  MyServices myServices =Get.find();

  HomeData homeData=HomeData(Get.find());

  List categories =[];
  List items =[];
late Statusrequest statusrequest;



getData()async{
    statusrequest = Statusrequest.loading;
    var response= await homeData.getData();
    print("============================= controller $response");

    statusrequest=handlingData(response);
     if(Statusrequest.success == statusrequest){

      if(response["status"]== "success"){
        categories.addAll(response["categories"]["data"]);
items.addAll(response["itemsview"]["data"]);
      }else{
      statusrequest= Statusrequest.failure;
     }

     }
         update();
}




goToItemsPage(List categories,int selectedcat,int categoreyId){

  Get.toNamed(AppRoutes.itemsPage,arguments: {
    "categories" :categories,
    "selectedcat":selectedcat,
    "categoreyId" :categoreyId,
});

}
  intialData() {
  
    getData();
  }

  @override
  void onInit() {
     search=TextEditingController();
    intialData();
    super.onInit();
  }

 @override
  void dispose() {
    search.dispose();
    super.dispose();
  }
}
