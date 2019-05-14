import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loja_virtual/model/ProductData.dart';

class CartProduct {

  String cID;
  String category;
  String pID;
  int quantity;
  String size;

  ProductData productData;

  CartProduct();

  CartProduct.fromDocument(DocumentSnapshot document) {
    cID = document.documentID;
    category = document.data["category"];
    pID = document.data["pID"];
    quantity= document.data["quantity"];
    size = document.data["size"];
  }

  Map<String, dynamic> toMap() {
    return {
      "category": category,
      "pID": pID,
      "quantity": quantity,
      "size": size,
      "product": productData.toResumeMap()
    };
  }

}