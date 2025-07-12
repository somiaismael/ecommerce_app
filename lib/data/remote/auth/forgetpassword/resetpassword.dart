import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class ResetpasswordData {
  Crud crud;
  ResetpasswordData(this.crud);

  dataCheck(String email,String password)async{
    var response= await crud.postData(AppLink.resetPassword, {

      "email":email,
      "password":password,

    });
    return response.fold((l)=> l, (r)=> r);
  }
}