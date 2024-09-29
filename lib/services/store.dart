import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_e_commerce/constants.dart';
import 'package:final_e_commerce/models/product.dart';

class Store {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  addProduct(Product product) {
    _firestore.collection(kProductsCollection).add({
      kProductName: product.pName,
      kProductPrice: product.pPrice,
      kProductCategory: product.pCategory,
      kProductDescription: product.pDescription,
      kProductLocation:product.pLocation
    });
  }
}
