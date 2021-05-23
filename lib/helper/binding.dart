import 'package:getxflutter/core/view_model/auth_view_model.dart';
import 'package:getxflutter/core/view_model/cart_view_model.dart';
import 'package:getxflutter/core/view_model/checkout_view_model.dart';
import 'package:getxflutter/core/view_model/control_view_model.dart';
import 'package:getxflutter/core/view_model/home_view_model.dart';
import 'package:get/get.dart';
import 'package:getxflutter/helper/local_storage_data.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => CartViewModel());
    Get.lazyPut(() => LocalStorageData());
    Get.lazyPut(() => CheckOutViewModel());
  }
}