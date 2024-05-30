// food items
class Food {
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final FoodCategory category;
  List<Addon> availableAddon;
  Food(
      {required this.name,
      required this.description,
      required this.imagePath,
      required this.price,
      required this.availableAddon, 
      required this.category
      });
}
// food category
enum FoodCategory{
  burgers,
  drinks,
  salads, 
  desserts,
  sides,
}

// food addons

class Addon{
  String name;
  double price;
  Addon({required this.name, required this.price});
}

