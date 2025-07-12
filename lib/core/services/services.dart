import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService{
  late SharedPreferences sharedPreferences;

  @override
  Future<MyServices> onInit() async{
  //  await Firebase.initializeApp();
    sharedPreferences=await SharedPreferences.getInstance();
    return this;
  }


}

initialization()async{
await Get.putAsync(() => MyServices().onInit());
}