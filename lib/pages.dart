import 'package:ecommerce/core/constant/roots.dart';
import 'package:ecommerce/core/middleware/my_middleware.dart';
import 'package:ecommerce/test.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/successresetpassword.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:ecommerce/view/screen/auth/signupverifycode.dart';
import 'package:ecommerce/view/screen/auth/success_signup.dart';
import 'package:ecommerce/view/screen/cart_page.dart';
import 'package:ecommerce/view/screen/favorite_page.dart';
import 'package:ecommerce/view/screen/home.dart';
import 'package:ecommerce/view/screen/home_screen.dart';
import 'package:ecommerce/view/screen/itemspage.dart';
import 'package:ecommerce/view/screen/language.dart';
import 'package:ecommerce/view/screen/auth/login.dart';
import 'package:ecommerce/view/screen/onboarding.dart';
import 'package:ecommerce/view/screen/auth/signup.dart';
import 'package:ecommerce/view/screen/productdetails.dart';
import 'package:ecommerce/view/widget/home/poductforyou.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>> pages = [
  
  GetPage(name: "/", page: () =>
   Language(), 
  middlewares: [MyMiddleware()]
  ),
  GetPage(
    name: AppRoutes.onBoarding,
    page: () => OnBoarding(),
  ),
  GetPage(
    // name:"/"
    name: AppRoutes.login, page: () => Login(),
  ),
  GetPage(
    name: AppRoutes.signup,
    page: () => SignUp(),
  ),
  GetPage(
    name: AppRoutes.verifycodeSignUp,
    page: () => SignUpVerifycode(),
  ),
  GetPage(
    name: AppRoutes.forgetpassword,
    page: () => ForgetPassword(),
  ),
  GetPage(
    name: AppRoutes.verifycode,
    page: () => Verifycode(),
  ),
  GetPage(
    name: AppRoutes.resetPassword,
    page: () => ResetPassword(),
  ),
  GetPage(
    name: AppRoutes.successresetPassword,
    page: () => SuccessResetPassword(),
  ),
  GetPage(name: AppRoutes.successSignup, page: () => SuccessSignup()),
  GetPage(name: AppRoutes.home, page: () => HomeScreen()),
  GetPage(
    name: AppRoutes.itemsPage,
    page: () => ItemsPage(),
  ),
  GetPage(
    name:
        //  "/"
        AppRoutes.productDetails,
    page: () => ProductDetails(),
  ),

   GetPage(
    name:
        AppRoutes.favorite,
    page: () => FavoritePage(),
  ),
  GetPage(
    name:AppRoutes.cart

  ,page: () => CartPage() ,),

];
