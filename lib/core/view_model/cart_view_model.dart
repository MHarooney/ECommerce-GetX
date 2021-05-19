import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getxflutter/core/service/database/cart_database_helper.dart';
import 'package:getxflutter/model/cart_product_model.dart';

class CartViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;

  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CartProductModel> _cartProductModel = [];
  List<CartProductModel> get cartProductModel => _cartProductModel;

  CartViewModel() {
    getAllProduct();
  }

  getAllProduct() async {
    _loading.value = true;

    var dbHelper = CartDatabaseHelper.db;
    _cartProductModel = await dbHelper.getAllProducts();

    print(_cartProductModel.length);

    _loading.value = false;
    update();
  }

  addProduct(CartProductModel cartProductModel) async {
    var dbHelper = CartDatabaseHelper.db;
    await dbHelper.insert(cartProductModel);
    update();
  }
}