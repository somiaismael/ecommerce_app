import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/model/myfavorite_model.dart';
import 'package:ecommerce/data/remote/favorite_data.dart';
import 'package:ecommerce/data/remote/favorite_page_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritePageController extends GetxController {
  FavoritePageData favoritePageData = FavoritePageData(Get.find());

  List<MyFavoriteModel> data = [];
  late Statusrequest statusrequest;
  MyServices myServices = Get.find();

  viewData() async {
    statusrequest = Statusrequest.loading;
    var response = await favoritePageData
        .viewFavoritePage(myServices.sharedPreferences.getInt("id").toString());
    print("============================= controller $response");

    statusrequest = handlingData(response);
    if (Statusrequest.success == statusrequest) {
      if (response["status"] == "success") {
        List responseData = response["data"];

        data.addAll(responseData.map((e) => MyFavoriteModel.fromJson(e)));
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
    update();
  }

  deletData(favoriteid) {
    var response =
        favoritePageData.deletFromFavoritePage(favoriteid.toString());

    data.removeWhere((element) => element.favoriteId == favoriteid);

    update();
  }

  @override
  void onInit() {
    viewData();
    super.onInit();
  }
}
