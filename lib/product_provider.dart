import 'cartmodel.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  List<CartModel> cartModelList = [];
  late CartModel cartModel;

  void getCartData({
    required String name,
    required String image,
    required double price,
    required int quantity,
  }) {
    cartModel =
        CartModel(name: name, quantity: quantity, price: price, image: image);
    cartModelList.add(cartModel);
  }

  List<CartModel> get getCartModelList {
    return List.from(cartModelList);
  }

  int get getCartModelListLength {
    return cartModelList.length;
  }

  void deleteCartProduct(int index) {
    cartModelList.removeAt(index);
    notifyListeners();
  }

  void deleteCheckOutProduct(int index) {
    checkOutModelList.removeAt(index);
    notifyListeners();
  }

  List<CartModel> checkOutModelList = [];
  late CartModel checkOutModel;

  void getCheckOutData({
    required String name,
    required String image,
    required double price,
    required int quantity,
  }) {
    checkOutModel =
        CartModel(name: name, quantity: quantity, price: price, image: image);
    checkOutModelList.add(checkOutModel);
  }

  List<CartModel> get getCheckOutModelList {
    return List.from(checkOutModelList);
  }

  int get getCheckOutModelListLength {
    return checkOutModelList.length;
  }
}
