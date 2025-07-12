import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class CheckEmailData {
  Crud crud;
  CheckEmailData(this.crud);

  dataCheck(String email)async{
    var response= await crud.postData(AppLink.checkEmail, {

      "email":email,


    });
    return response.fold((l)=> l, (r)=> r);
  }
}