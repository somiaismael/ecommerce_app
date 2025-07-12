import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class VerifyCodeRestPasswordData {
  Crud crud;
  VerifyCodeRestPasswordData(this.crud);

  addData(String email,String verfiycode) async{
    var response=await crud.postData(AppLink.verfiycodResetPassword, {
      "email":email,
      "verfiycode":verfiycode
    });
    return response.fold((l)=> l, (r)=> r);

  }
}