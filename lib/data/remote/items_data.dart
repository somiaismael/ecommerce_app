import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);

  getData( categoreyId ,userid)async{
    var response= await crud.postData(AppLink.items, {
      "categoreyid" : categoreyId.toString(),
      "userid" : userid.toString(),


    });
    return response.fold((l)=> l, (r)=> r);
  }
}