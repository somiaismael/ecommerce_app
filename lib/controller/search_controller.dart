import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/data/model/items_model.dart';
import 'package:ecommerce/data/remote/search.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
class SearchController extends GetxController{
   late TextEditingController search;
 bool isSearch =false;
   SearchData searchData=SearchData(Get.find());

     List<ItemsModel> searchItemsList =[];

  late Statusrequest statusrequest;
onSearchChanged(val){
  if(val == ""){
    isSearch =false;
  }
  update();
}
onSearchIconTap(){
isSearch =true;
getSearchData();
update();
}

getSearchData()async{
   statusrequest = Statusrequest.loading;
   update();
    var response= await searchData.getSearchData(search.text);
    print("============================= searchhhhhhhhhcontroller $response");

    statusrequest=handlingData(response);
     if(Statusrequest.success == statusrequest){

      if(response["status"]== "success"){
        searchItemsList.clear();
             List responseDataList=response['data'];
             searchItemsList.addAll(responseDataList.map((e)=> ItemsModel.fromJson(e)));
      }else{
      statusrequest= Statusrequest.failure;
     }

     }
         update();
}
  // intialData() {
  //   search=TextEditingController();
 
  // }

  // @override
  // void onInit() {
  //   intialData();
  //   super.onInit();
  // }

  // @override
  // void dispose() {
  //   search.dispose();
  //   super.dispose();
  // }
}