import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../models/clothes.dart';

class CartController extends GetxController {
  var cartItems = <Clothes>[].obs;
  var total = 0.0.obs;

  void addToCart(Clothes clothes) {
    cartItems.add(clothes);
    total.value += double.parse(clothes.price.replaceAll(r'$', '').trim());
  }

  void removeFromCart(Clothes clothes) {
    cartItems.remove(clothes);
    total.value -= double.parse(clothes.price.replaceAll(r'$', '').trim());
  }
}
