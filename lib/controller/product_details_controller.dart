import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/model/items_model.dart';
import 'package:ecommerce/data/remote/cart_data.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController{


  ItemsModel? itemsModel;
 int countItems=0;
CartData cartData = CartData(Get.find());
 late Statusrequest statusrequest = Statusrequest.none;
  MyServices myServices = Get.find();

  addToCartData(itemId) async {
    statusrequest = Statusrequest.loading;

    update();
    var response = await cartData.addData(
      myServices.sharedPreferences.getInt("id").toString(),
      itemId.toString(),
    );
    print("============================= controller $response");

    statusrequest = handlingData(response);
    if (Statusrequest.success == statusrequest) {
      if (response["status"] == "success") {
        Get.snackbar("success", "this item become in your cart");
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
    update();
  }

  deletFromCartData(itemId) async {
    statusrequest = Statusrequest.loading;
    update();
    var response = await cartData.deletData(
      myServices.sharedPreferences.getInt("id").toString(),
      itemId.toString(),
    );
    print("============================= controller $response");

    statusrequest = handlingData(response);
    if (Statusrequest.success == statusrequest) {
      if (response["status"] == "success") {
        Get.snackbar("success", "this item become delet from your cart");
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
    update();
  }


 getCounItems(itemId) async {
//     statusrequest = Statusrequest.loading;
// update();
    var response = await cartData.countItemsInCart(
      myServices.sharedPreferences.getInt("id").toString(),
      itemId.toString(),
    );
    print("============================= controller $response");

    statusrequest = handlingData(response);
    if (Statusrequest.success == statusrequest) {
      if (response["status"] == "success") {
        int count = response["data"];
        print(
            "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
        print(count);
        return count;
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
  }

// عشان الفرونت اند
  add(){
    addToCartData(itemsModel!.itemsId);
    countItems ++;
    update();
  }

  remove(){
    if(countItems > 0){
    deletFromCartData(itemsModel!.itemsId);
 countItems --;
    }
     update();
  }
// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\النهايه
  
     intialData() async {
   itemsModel= Get.arguments["itemsModel"];
   
   countItems = await getCounItems(itemsModel!.itemsId);
  
     update();
  } 


  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}