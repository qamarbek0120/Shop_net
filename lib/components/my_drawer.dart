import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_net/components/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                  child: Center(
                    child: Icon(
                      FontAwesomeIcons.cartShopping,
                      size: 70,
                    ),
                  )),
              MyListTile(text: "S H O P", icon: FontAwesomeIcons.house, onTap: ()=> Navigator.pop(context)),
              SizedBox(height: 10,),
              MyListTile(text: "C A R T", icon: FontAwesomeIcons.cartFlatbed, onTap: ()=> Navigator.pushNamed(context, '/cart_page')),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: MyListTile(text: "E X I T", icon: FontAwesomeIcons.arrowRightFromBracket, onTap: (){}),
              )
            ],
          )
        ],
      ),
    );
  }
}
