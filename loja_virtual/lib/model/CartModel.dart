import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:loja_virtual/model/CartProduct.dart';
import 'package:loja_virtual/model/UserModel.dart';
import 'package:scoped_model/scoped_model.dart';


class CartModel extends Model {

  UserModel user;

  List<CartProduct> products = [];

  String couponCode;
  int discountPercentage = 0;

  bool isLoading = false;

  CartModel(this.user) {
    if(user.isLoggedIn()) {
      _loadCartItems();
    }
  }

  static CartModel of(BuildContext context) =>
      ScopedModel.of<CartModel>(context);

  void addCartItem(CartProduct cartProduct) {
    products.add(cartProduct);

    Firestore.instance.collection("users")
        .document(user.firebaseUser.uid)
    .collection("cart")
    .add(cartProduct.toMap()).then((doc){
      cartProduct.cID = doc.documentID;
    });
  }

  void removeCartItem(CartProduct cartProduct) {

    Firestore.instance.collection("users")
        .document(user.firebaseUser.uid)
        .collection("cart")
        .document(cartProduct.cID).delete();

    products.remove(cartProduct);

    notifyListeners();
  }

  void decProduct(CartProduct cartProduct) {
    cartProduct.quantity--;
    Firestore.instance.collection("users")
        .document(user.firebaseUser.uid)
        .collection("cart")
        .document(cartProduct.cID).updateData(cartProduct.toMap());
    notifyListeners();
  }

  void incProduct(CartProduct cartProduct) {
    cartProduct.quantity++;
    Firestore.instance.collection("users")
        .document(user.firebaseUser.uid)
        .collection("cart")
        .document(cartProduct.cID).updateData(cartProduct.toMap());
    notifyListeners();
  }

  void _loadCartItems() async{
    QuerySnapshot query = await
    Firestore.instance.collection("users")
        .document(user.firebaseUser.uid)
        .collection("cart")
    .getDocuments();

    products = query.documents.map((doc) =>
    CartProduct.fromDocument(doc)).toList();

    notifyListeners();
  }

  void setCoupon(String couponCode, int discountPercentage) {
    this.couponCode = couponCode;
    this.discountPercentage = discountPercentage;
  }

  double getProductsPrice() {
    double price = 0.0;

    for(CartProduct c in products) {
      if(c.productData != null){
        price += c.quantity * c.productData.price;
      }
    }

    return price;
  }

  double getDiscount() {
    return getProductsPrice() * discountPercentage / 100;
  }

  double getShipPrice() {
    return 9.99;
  }

  void updatePrices() {
    notifyListeners();
  }

  Future<String> finishOrder() async{

    if(products.length == 0) return null;

    isLoading = true;
    notifyListeners();
    double productsPrice = getProductsPrice();
    double shipPrice = getShipPrice();
    double discount = getDiscount();

    DocumentReference refOrder = await
    Firestore.instance.collection("orders").add(
      {
        "clientID":user.firebaseUser.uid,
        "products": products.map((cartProduct)=>cartProduct.toMap()).toList(),
        "shipPrice": shipPrice,
        "productsPrice": productsPrice,
        "discount": discount,
        "totalPrice": productsPrice - discount + shipPrice,
        "status": 1
      });
    
    await Firestore.instance.collection("users")
    .document(user.firebaseUser.uid)
    .collection("orders")
    .document(refOrder.documentID)
    .setData({"orderID": refOrder.documentID});
    
    QuerySnapshot query = await Firestore.instance.collection("users")
    .document(user.firebaseUser.uid).collection("cart")
    .getDocuments();

    for(DocumentSnapshot doc in query.documents) {
      doc.reference.delete();
    }

    products.clear();

    couponCode = null;
    discountPercentage = 0;

    isLoading = false;
    notifyListeners();

    return refOrder.documentID;
  }

}