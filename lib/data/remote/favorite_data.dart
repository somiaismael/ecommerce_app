import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);

  addFavorite( userid ,itemsid )async{
    var response= await crud.postData(AppLink.addFavorite, {
      "userId" : userid.toString(),
      "itemId" : itemsid.toString(),

    });
    return response.fold((l)=> l, (r)=> r);
  }

    deletFavorite( userid ,itemsid )async{
    var response= await crud.postData(AppLink.deletFavorite, {
      "userId" : userid.toString(),
      "itemId" : itemsid.toString(),

    });
      return response.fold((l)=> l, (r)=> r);
  }

}