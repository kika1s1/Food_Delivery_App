import 'package:flutter/material.dart';
import 'package:food_delivery/components/my_quantity_selector.dart';
import 'package:food_delivery/models/cart_item.dart';
import 'package:food_delivery/models/restaurant.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;
  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) => Container(
        decoration:
            BoxDecoration(color: Theme.of(context).colorScheme.secondary),
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                
                children: [
                  // food image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      cartItem.food.imagePath,
                      height: 100,
                      width: 100,
                    ),
                  ),
                  const SizedBox(width: 10,),

                  // name and price
                  Column(
                    children: [
                      // food name
                      Text(cartItem.food.name),

                      // price
                      Text("ETB${cartItem.food.price.toString()}",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary
                      ),
                      )
                    ],
                  ),
                  const Spacer(),

                  // decrementing and incrementing price
                  MyQuantitySelector(
                    quantity: cartItem.quantity,
                    food: cartItem.food,
                    onDecrement: () {
                      restaurant.removeFromCart(cartItem);
                    },
                    onIncrement: () {
                      restaurant.addToCart(
                          cartItem.food, cartItem.selectedAddons);
                    },
                  ),
                ],
              ),
            ),
            // addon
            SizedBox(
              height: cartItem.selectedAddons.isEmpty ? 0 : 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
                children: cartItem.selectedAddons
                    .map(
                      (addon) => Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: FilterChip(
                            label: Row(
                              children: [
                                // addon name
                                Text(addon.name),
                                // addon price
                                Text("ETB${addon.price.toString()}"),
                              ],
                            ),
                            shape: StadiumBorder(
                              side: BorderSide(color: Theme.of(context).colorScheme.primary)
                            ),
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                            labelStyle: TextStyle(
                                fontSize: 16,
                                color:
                                    Theme.of(context).colorScheme.inversePrimary),
                            onSelected: (value) {}),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
