import 'package:ecommerce/controller/search_controller.dart';
import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/roots.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/model/items_model.dart';
import 'package:ecommerce/data/remote/items_data.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ItemspageController extends SearchController{

  List categories=[];
  int? selectedCat;
int? catId;
  ItemsData testData=ItemsData(Get.find());

  List data =[];
  late Statusrequest statusrequest;
  MyServices myServices=Get.find();

 
  

  viewData(catId) async{
    data.clear();
    statusrequest = Statusrequest.loading;
    var response= await testData.getData(catId.toString(),myServices.sharedPreferences.getInt("id").toString() );
    print("============================= controller $response");

    statusrequest=handlingData(response);
     if(Statusrequest.success == statusrequest){

      if(response["status"]== "success"){
        data.addAll(response["data"]);

      }else{
      statusrequest= Statusrequest.failure;
     }

     }
         update();
  }

  changeCategory( val, selectedCategtey){
    selectedCat=val;
   
     viewData(selectedCategtey.toString());
    update();

  }

  goToProductDetails(ItemsModel itemsModel){
    Get.toNamed(AppRoutes.productDetails,arguments: {
      "itemsModel":itemsModel
    });

  }

    intialData() {
   categories= Get.arguments["categories"];
      selectedCat= Get.arguments["selectedcat"];
      catId= Get.arguments["categoreyId"];
        search=TextEditingController();
      viewData(catId);
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
  @override
    void dispose() {
    search.dispose();
    super.dispose();
  }
}