import '../models/models.dart';
import '../utils/utils.dart';

class CartsNotifier {
  Future<List<ProductModel>> getItemsInCart() async {
    return cartBox.value.values.toList();
  }

  Future<void> removeItemFromCart(int index) async {
    await cartBox.value.deleteAt(index);
  }

  double calculateCartTotal() {
    final cartItems = cartBox.value..values;

    double total = 0.0;

    for (var item in cartItems.values) {
      total += item.price ?? 0;
    }

    return total;
  }
}
