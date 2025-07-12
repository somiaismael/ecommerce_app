import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/remote/favorite_data.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController{
  Map favorite={};// key = items id   // value = 0 or 1
                 
    FavoriteData favoriteData=FavoriteData(Get.find());

 
  late Statusrequest statusrequest=Statusrequest.none;
  MyServices myServices=Get.find();

  addData(itemId) async{
    
    statusrequest = Statusrequest.loading;

    var response= await favoriteData.addFavorite(myServices.sharedPreferences.getInt("id").toString() ,itemId.toString(),);
    print("============================= controller $response");

    statusrequest=handlingData(response);
     if(Statusrequest.success == statusrequest){

      if(response["status"]== "success"){
        Get.snackbar("success", "this item become in your favorite");
        
      }else{
      statusrequest= Statusrequest.failure;
     }

     }
      
  }

 deletData(itemId) async{
   
    statusrequest = Statusrequest.loading;

    var response= await favoriteData.deletFavorite(myServices.sharedPreferences.getInt("id").toString() ,itemId.toString(),);
    print("============================= controller $response");

    statusrequest=handlingData(response);
     if(Statusrequest.success == statusrequest){

      if(response["status"]== "success"){
       Get.snackbar("success", "this item become delet from your favorite");
        
      }else{
      statusrequest= Statusrequest.failure;
     }

     }
       
  }

   
   

  setFavorite(id,value){
   favorite[id] =value;
   update();
  }
}

