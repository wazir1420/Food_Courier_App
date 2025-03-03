import 'package:stacked/stacked.dart';

class OrderItem {
  final String image;
  final String name;
  final String company;
  final double price;
  int quantity;

  OrderItem({
    required this.image,
    required this.name,
    required this.company,
    required this.price,
    this.quantity = 1,
  });
}

class OrderDetailViewModel extends BaseViewModel {
  final List<OrderItem> _orderItems = [
    OrderItem(
      image: 'assets/images/Menu1.pn',
      name: 'Chicken Burger',
      company: 'Burger Factory LTD',
      price: 15.0,
    ),
    OrderItem(
      image: 'assets/images/Menu2.png',
      name: 'Onion Pizza',
      company: 'Pizza Palace',
      price: 15.0,
    ),
    OrderItem(
      image: 'assets/images/Menu3.png',
      name: 'Spicy Shawarma',
      company: 'Hot cool Spot',
      price: 15.0,
    ),
  ];

  List<OrderItem> get orderItems => _orderItems;

  void incrementQuantity(int index) {
    _orderItems[index].quantity++;
    rebuildUi();
  }

  void decrementQuantity(int index) {
    if (_orderItems[index].quantity > 1) {
      _orderItems[index].quantity--;
      rebuildUi();
    }
  }

  double get subTotal => _orderItems.fold(
        0,
        (sum, item) => sum + (item.price * item.quantity),
      );

  double get deliveryCharge => 5.0;
  double get discount => 2.0;
  double get total => subTotal + deliveryCharge - discount;
}
