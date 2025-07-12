class AppLink {


  static const String root="http://10.0.2.2/ecommerce";

  //images
  static const String categoiesRoot="http://10.0.2.2/ecommerce/upload/categories";
  static const String itemsRoot="http://10.0.2.2/ecommerce/upload/items";

 //
 static const String test="$root/test.php";

 //auth
 static const String signUp="$root/auth/signup.php";
 static const String verfiycodeSignUp="$root/auth/verfiycode.php";
 static const String login="$root/auth/login.php";
  static const String resend="$root/auth/resend_verfiycode.php";
 //forget password
  static const String checkEmail="$root/auth/forgetpassword/checkemail.php";
 static const String verfiycodResetPassword="$root/auth/forgetpassword/verfiycode.php";
 static const String resetPassword="$root/auth/forgetpassword/resetpassword.php";

 //home
  static const String home="$root/home.php";

   //items
  static const String items="$root/items/view.php";
     //favorite
  static const String addFavorite="$root/favorite/add.php";
static const String deletFavorite="$root/favorite/delet.php";
static const String viewFavorite="$root/favorite/view.php";
static const String deletFromFavoritePage="$root/favorite/delet_from_favorite_page.php";

//cart
  static const String addCart="$root/cart/add.php";
static const String deletCart="$root/cart/delet.php";
static const String viewCart="$root/cart/view.php";
static const String countItemsInCart="$root/cart/get_count_items.php";

//search
static const String search="$root/search.php";
}