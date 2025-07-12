import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class SearchData {
  Crud crud;
  SearchData(this.crud);

  getSearchData(String search)async{
    var response= await crud.postData(AppLink.search, {
       "search":search.toString()
    });
    return response.fold((l)=> l, (r)=> r);
  }
}