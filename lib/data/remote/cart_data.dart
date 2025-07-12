import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class CartData {
  Crud crud;
  CartData(this.crud);

  getData(userid)async{
    var response= await crud.postData(AppLink.viewCart, {
      "userId" : userid.toString(),

    });
    return response.fold((l)=> l, (r)=> r);
  }

    addData( userid ,itemsid )async{
    var response= await crud.postData(AppLink.addCart, {
      "userId" : userid.toString(),
      "itemId" : itemsid.toString(),

    });
    return response.fold((l)=> l, (r)=> r);
  }

    deletData( userid ,itemsid )async{
    var response= await crud.postData(AppLink.deletCart, {
      "userId" : userid.toString(),
      "itemId" : itemsid.toString(),

    });
      return response.fold((l)=> l, (r)=> r);
  }

  countItemsInCart( userid ,itemsid )async{
    var response= await crud.postData(AppLink.countItemsInCart, {
      "userId" : userid.toString(),
      "itemId" : itemsid.toString(),

    });
      return response.fold((l)=> l, (r)=> r);
  }
}