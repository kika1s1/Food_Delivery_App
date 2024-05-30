import 'package:flutter/material.dart';
import 'package:food_delivery/models/food.dart';

class Restaurant extends ChangeNotifier{
  // list of food menu
  final List<Food> _menu = [
    // burgers
    Food(
        name: "Classic Cheeseburger",
        description: "A juicy beef patty topped with melted cheese, lettuce, tomato, and pickles, served on a sesame seed bun.",
        imagePath: "lib/images/burgers/burger1.jpg",
        price: 8.99,
        availableAddon: [Addon(name: "Extra Cheese", price: 1.50)],
        category: FoodCategory.burgers),
    Food(
        name: "Bacon Burger",
        description: "A savory burger topped with crispy bacon, lettuce, tomato, and special sauce.",
        imagePath: "lib/images/burgers/burger2.jpg",
        price: 9.99,
        availableAddon: [Addon(name: "Avocado", price: 1.75)],
        category: FoodCategory.burgers),
    Food(
        name: "Veggie Burger",
        description: "A delicious veggie patty with lettuce, tomato, and vegan mayo on a whole wheat bun.",
        imagePath: "lib/images/burgers/burger3.jpg",
        price: 7.99,
        availableAddon: [Addon(name: "Grilled Mushrooms", price: 1.50)],
        category: FoodCategory.burgers),
    // desserts
    Food(
        name: "Double Cheeseburger",
        description: "Two juicy beef patties with double cheese, lettuce, tomato, and pickles.",
        imagePath: "lib/images/desserts/dessert1.jpg",
        price: 11.99,
        availableAddon:[ Addon(name: "Bacon", price: 2.00)],
        category: FoodCategory.desserts),
    Food(
        name: "Spicy Chicken Burger",
        description: "A spicy fried chicken patty with lettuce, tomato, and spicy mayo.",
        imagePath: "lib/images/desserts/dessert2.jpg",
        price: 9.49,
        availableAddon: [Addon(name: "Extra Sauce", price: 0.75)],
        category: FoodCategory.desserts),
    Food(
        name: "Caesar Salad",
        description: "Fresh romaine lettuce tossed with Caesar dressing, croutons, and parmesan cheese.",
        imagePath: "lib/images/desserts/dessert3.jpg",
        price: 6.99,
        availableAddon: [Addon(name: "Grilled Chicken", price: 2.50)],
        category: FoodCategory.desserts),
    // Salads
    Food(
        name: "Greek Salad",
        description: "A mix of cucumbers, tomatoes, olives, and feta cheese with a Greek dressing.",
        imagePath: "lib/images/salads/salads1.jpg",
        price: 7.49,
        availableAddon: [Addon(name: "Pita Bread", price: 1.00)],
        category: FoodCategory.salads),
    Food(
        name: "Garden Salad",
        description: "A variety of fresh vegetables with your choice of dressing.",
        imagePath: "lib/images/salads/salads2.jpg",
        price: 5.99,
        availableAddon: [Addon(name: "Boiled Egg", price: 1.25)],
        category: FoodCategory.salads),
    Food(
        name: "Cobb Salad",
        description: "A hearty salad with chicken, bacon, avocado, egg, and blue cheese.",
        imagePath: "lib/images/salads/salads1.jpg",
        price: 8.99,
        availableAddon: [Addon(name: "Extra Avocado", price: 1.50)],
        category: FoodCategory.salads),
        // Drinks
    Food(
        name: "Spinach Salad",
        description: "Fresh spinach with strawberries, almonds, and a balsamic vinaigrette.",
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
        description: "Fresh spinach with strawberries, almonds, and a balsamic vinaigrette.",
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

  // O P E R A T I O N S
  // add to cart
  // remove from cart
  // get total price of cart
  // total number of items in the card
  // clear cart

  // H E L P E R S
  // generate reciept
  // the double to money
  // format list addon to string  summary



}