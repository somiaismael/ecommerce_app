import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class SignUpData {
  Crud crud;
  SignUpData(this.crud);

  addData(String username ,String password ,String email ,String phone)async{
    var response= await crud.postData(AppLink.signUp, {
      "username":username,
      "password":password,
      "email":email,
      "phone":phone,

    });
    return response.fold((l)=> l, (r)=> r);
  }
}