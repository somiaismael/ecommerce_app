class CartModel {
  int? itemsprice;
  int? itemscount;
  int? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDec;
  String? itemsDecAr;
  String? itemsImage;
  int? itemsCount;
  int? itemsActive;
  int? itemsPrice;
  int? itemsDiscount;
  String? itemsDate;
  int? itemsCat;
  int? cartId;
  int? cartUserid;
  int? cartItemsid;
  int? cartOrders;

  CartModel(
      {this.itemsprice,
      this.itemscount,
      this.itemsId,
      this.itemsName,
      this.itemsNameAr,
      this.itemsDec,
      this.itemsDecAr,
      this.itemsImage,
      this.itemsCount,
      this.itemsActive,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsDate,
      this.itemsCat,
      this.cartId,
      this.cartUserid,
      this.cartItemsid,
      this.cartOrders});

  CartModel.fromJson(Map<String, dynamic> json) {
    itemsprice = json['itemsprice'];
    itemscount = json['itemscount'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDec = json['items_dec'];
    itemsDecAr = json['items_dec_ar'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsDate = json['items_date'];
    itemsCat = json['items_cat'];
    cartId = json['cart_id'];
    cartUserid = json['cart_userid'];
    cartItemsid = json['cart_itemsid'];
    cartOrders = json['cart_orders'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemsprice'] = this.itemsprice;
    data['itemscount'] = this.itemscount;
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_name_ar'] = this.itemsNameAr;
    data['items_dec'] = this.itemsDec;
    data['items_dec_ar'] = this.itemsDecAr;
    data['items_image'] = this.itemsImage;
    data['items_count'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPrice;
    data['items_discount'] = this.itemsDiscount;
    data['items_date'] = this.itemsDate;
    data['items_cat'] = this.itemsCat;
    data['cart_id'] = this.cartId;
    data['cart_userid'] = this.cartUserid;
    data['cart_itemsid'] = this.cartItemsid;
    data['cart_orders'] = this.cartOrders;
    return data;
  }
}