import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/data/model/cart_model.dart';
import 'package:ecommerce/data/remote/cart_data.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../core/services/services.dart';

class CartController extends GetxController {
  CartData cartData = CartData(Get.find());

  List<CartModel> data = [];
  double totalItemsPrice = 0.0;
  int totalItemsCount = 0;
  late Statusrequest statusrequest = Statusrequest.none;
  MyServices myServices = Get.find();

  getCartData() async {
    statusrequest = Statusrequest.loading;

    update();
    var response = await cartData
        .getData(myServices.sharedPreferences.getInt("id").toString());
    print("============================= controller $response");

    statusrequest = handlingData(response);
    if (Statusrequest.success == statusrequest) {
      if (response["status"] == "success") {
        if (response["cartdata"]["status"] == "success") {
          List listReponse = response["cartdata"]["data"];
          print(
              "============================= &&&&&&&&&&listReponse $listReponse");
          data.clear();
          data.addAll(listReponse.map((e) => CartModel.fromJson(e)));
          print("============================= data $data");
          Map listsumPriceAndCount = response["sumPriceAndCount"];
          totalItemsCount = int.parse(listsumPriceAndCount["totalitemscount"]);
          totalItemsPrice =
              double.parse(listsumPriceAndCount["totalitemsprice"].toString());
        }
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
    update();
  }

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

  
  restCartValues() {
    totalItemsPrice = 0.0;
    totalItemsCount = 0;
    data.clear();
  }

  refreshCartPage() {
    restCartValues();
    getCartData();
  }

  @override
  void onInit() {
    getCartData();
    super.onInit();
  }
}
