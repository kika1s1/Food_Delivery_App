import 'package:flutter/material.dart';
import 'package:food_delivery/components/my_drawer_tile.dart';
import 'package:food_delivery/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          // app logo
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Icon(Icons.lock_open_rounded, size: 80,
            color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),


          
          // home
          MyDrawerTile(onTap: (){
            Navigator.pop(context);
          }, text: "H O M E", icon: Icons.home),

          // setting
          MyDrawerTile(onTap: (){
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const SettingsPage(),),);
          }, text: "S E T I N G S", icon: Icons.settings),
          const Spacer(),
          // logout
          MyDrawerTile(onTap: (){}, text: "L O G O U T", icon: Icons.logout),
          const SizedBox(height: 25,),
        ],
      ),

    );
  }
}