import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class VerifyCodeSignupData {
  Crud crud;
  VerifyCodeSignupData(this.crud);

  addData(String email,String verfiycode) async{
    var response=await crud.postData(AppLink.verfiycodeSignUp, {
      "email":email,
      "verfiycode":verfiycode
    });
    return response.fold((l)=> l, (r)=> r);

  }

    resendVerfiyCode(String email )async{
    var response= await crud.postData(AppLink.resend, {
      "email":email,
    });
    return response.fold((l)=> l, (r)=> r);
  }
}