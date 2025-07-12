import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class FavoritePageData {
  Crud crud;
  FavoritePageData(this.crud);


    deletFromFavoritePage( favoriteId )async{
    var response= await crud.postData(AppLink.deletFromFavoritePage, {

      "id" : favoriteId.toString(),

    });
      return response.fold((l)=> l, (r)=> r);
  }

      viewFavoritePage( userid  )async{
    var response= await crud.postData(AppLink.viewFavorite, {
      "userId" : userid.toString(),
   

    });
      return response.fold((l)=> l, (r)=> r);
  }
}