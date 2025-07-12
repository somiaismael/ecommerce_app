import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class HomeData {
    Crud crud;
  HomeData(this.crud);

  getData()async{
    var response= await crud.postData(AppLink.home, {});
    return response.fold((l)=> l, (r)=> r);
  }
}