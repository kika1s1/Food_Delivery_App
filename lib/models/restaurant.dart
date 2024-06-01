import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/models/cart_item.dart';
import 'package:food_delivery/models/food.dart';
import 'package:intl/intl.dart';

class Restaurant extends ChangeNotifier {
  // list of food menu
  final List<Food> _menu = [
    // burgers
    Food(
        name: "Classic Cheeseburger",
        description:
            "A juicy beef patty topped with melted cheese, lettuce, tomato, and pickles, served on a sesame seed bun.",
        imagePath: "lib/images/burgers/burger1.jpg",
        price: 8.99,
        availableAddon: [
          Addon(name: "Extra Cheese", price: 1.50),
          Addon(name: "Extra Cheese", price: 1.50),
          Addon(name: "Extra Cheese", price: 1.50),
          Addon(name: "Extra Cheese", price: 1.50)
        ],
        category: FoodCategory.burgers),
    Food(
        name: "Bacon Burger",
        description:
            "A savory burger topped with crispy bacon, lettuce, tomato, and special sauce.",
        imagePath: "lib/images/burgers/burger2.jpg",
        price: 9.99,
        availableAddon: [Addon(name: "Avocado", price: 1.75)],
        category: FoodCategory.burgers),
    Food(
        name: "Veggie Burger",
        description:
            "A delicious veggie patty with lettuce, tomato, and vegan mayo on a whole wheat bun.",
        imagePath: "lib/images/burgers/burger3.jpg",
        price: 7.99,
        availableAddon: [Addon(name: "Grilled Mushrooms", price: 1.50)],
        category: FoodCategory.burgers),
    // desserts
    Food(
        name: "Double Cheeseburger",
        description:
            "Two juicy beef patties with double cheese, lettuce, tomato, and pickles.",
        imagePath: "lib/images/desserts/dessert1.jpg",
        price: 11.99,
        availableAddon: [Addon(name: "Bacon", price: 2.00)],
        category: FoodCategory.desserts),
    Food(
        name: "Spicy Chicken Burger",
        description:
            "A spicy fried chicken patty with lettuce, tomato, and spicy mayo.",
        imagePath: "lib/images/desserts/dessert2.jpg",
        price: 9.49,
        availableAddon: [Addon(name: "Extra Sauce", price: 0.75)],
        category: FoodCategory.desserts),
    Food(
        name: "Caesar Salad",
        description:
            "Fresh romaine lettuce tossed with Caesar dressing, croutons, and parmesan cheese.",
        imagePath: "lib/images/desserts/dessert3.jpg",
        price: 6.99,
        availableAddon: [Addon(name: "Grilled Chicken", price: 2.50)],
        category: FoodCategory.desserts),
    // Salads
    Food(
        name: "Greek Salad",
        description:
            "A mix of cucumbers, tomatoes, olives, and feta cheese with a Greek dressing.",
        imagePath: "lib/images/salads/salads1.jpg",
        price: 7.49,
        availableAddon: [Addon(name: "Pita Bread", price: 1.00)],
        category: FoodCategory.salads),
    Food(
        name: "Garden Salad",
        description:
            "A variety of fresh vegetables with your choice of dressing.",
        imagePath: "lib/images/salads/salads2.jpg",
        price: 5.99,
        availableAddon: [Addon(name: "Boiled Egg", price: 1.25)],
        category: FoodCategory.salads),
    Food(
        name: "Cobb Salad",
        description:
            "A hearty salad with chicken, bacon, avocado, egg, and blue cheese.",
        imagePath: "lib/images/salads/salads1.jpg",
        price: 8.99,
        availableAddon: [Addon(name: "Extra Avocado", price: 1.50)],
        category: FoodCategory.salads),
    // Drinks
    Food(
        name: "Spinach Salad",
        description:
            "Fresh spinach with strawberries, almonds, and a balsamic vinaigrette.",
        imagePath: "lib/images/drinks/drink1.jpg",
        price: 6.49,
        availableAddon: [Addon(name: "Feta Cheese", price: 1.00)],
        category: FoodCategory.drinks),
    Food(
        name: "French Fries",
        description: "Crispy golden fries seasoned to perfection.",
        imagePath: "lib/images/drinks/drink2.jpg",
        price: 2.99,
        availableAddon: [Addon(name: "Chili Cheese", price: 1.50)],
        category: FoodCategory.drinks),
    Food(
        name: "French Fries",
        description: "Crispy golden fries seasoned to perfection.",
        imagePath: "lib/images/drinks/drink3.jpg",
        price: 2.99,
        availableAddon: [Addon(name: "Chili Cheese", price: 1.50)],
        category: FoodCategory.drinks),
    // Sides
    Food(
        name: "Spinach Salad",
        description:
            "Fresh spinach with strawberries, almonds, and a balsamic vinaigrette.",
        imagePath: "lib/images/sides/side1.jpg",
        price: 6.49,
        availableAddon: [Addon(name: "Feta Cheese", price: 1.00)],
        category: FoodCategory.sides),
    Food(
        name: "French Fries",
        description: "Crispy golden fries seasoned to perfection.",
        imagePath: "lib/images/sides/side2.jpg",
        price: 2.99,
        availableAddon: [Addon(name: "Chili Cheese", price: 1.50)],
        category: FoodCategory.sides),
    Food(
        name: "French Fries",
        description: "Crispy golden fries seasoned to perfection.",
        imagePath: "lib/images/sides/side2.jpg",
        price: 2.99,
        availableAddon: [Addon(name: "Chili Cheese", price: 1.50)],
        category: FoodCategory.sides),
  ];

  // G E T T E R

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;

  // O P E R A T I O N S
  // user cart
  final List<CartItem> _cart = [];
  // add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    CartItem? cartitem = _cart.firstWhereOrNull((item) {
      // check if the food item are the same
      bool isSameFood = item.food == food;

      // check if the list of selected addons are the same
      bool isSameAddons =
          const ListEquality().equals(item.selectedAddons, selectedAddons);
      return isSameAddons && isSameFood;
    });

    // if item already exist increase quantity
    if (cartitem != null) {
      cartitem.quantity++;
    }
    // otherwise add the new item to the cart
    else {
      _cart.add(
        CartItem(food: food, selectedAddons: selectedAddons),
      );
    }
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(CartItem cartitem) {
    int cartIndex = _cart.indexOf(cartitem);
    if (cartIndex != 1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity -= 1;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  // get total price of cart
  double getTotalPrice() {
    double total = 0.0;
    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;
      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }

      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  // total number of items in the card
  int getTotalItemCount() {
    int totalItemCount = 0;
    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  String formattedDate(){
    DateTime now = DateTime.now();
    DateTime newTime = now.add(const Duration(minutes: 30));
    String formattedNewTime = DateFormat('h:mm a').format(newTime);

    return formattedNewTime;

  }

  // clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  // H E L P E R S
  // generate reciept
// generate a receipt
String displayCartReceipt() {
  final receipt = StringBuffer();
  receipt.writeln("Here's your receipt.");
  receipt.writeln();

  // format the date to include up to seconds only
  String formattedDate = 
    DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

  receipt.writeln(formattedDate);
  receipt.writeln();
  receipt.writeln("-----------");

  for (final cartItem in _cart) {
    receipt.writeln(
      "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
    if (cartItem.selectedAddons.isNotEmpty) {
      receipt.writeln("  Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
    }
    receipt.writeln();
  }
  receipt.writeln("-----------");
  receipt.writeln();
  receipt.writeln("Total Items: ${getTotalItemCount()}");
  receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");

  return receipt.toString();
}


  // format date include upto seconds only
  
  // the double to money
  String _formatPrice(double price) {
    return "ETB${price.toStringAsFixed(2)}";
  }

  // format list addon to string  summary
  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join(" ");
  }
}
