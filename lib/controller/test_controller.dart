import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/data/remote/test_data.dart';
import 'package:get/get.dart';

class TestController extends GetxController{

  TestData testData=TestData(Get.find());

  List data =[];
  late Statusrequest statusrequest;

  viewData() async{
    statusrequest = Statusrequest.loading;
    var response= await testData.getData();
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

  @override
  void onInit() {
    viewData();
    super.onInit();
  }
}