import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_net/components/my_drawer.dart';
import 'package:shop_net/components/my_product_tile.dart';
import 'package:shop_net/models/shop.dart';
class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("H O M E",style: GoogleFonts.syne(),),
        actions: [
          IconButton(onPressed: ()=>Navigator.pushNamed(context, "/cart_page"), icon: Icon(FontAwesomeIcons.cartShopping))
        ],
      ),
      drawer: MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: [
          SizedBox(height: 25,),
          Center(child: const Text("Pick from a premium products")),


          SizedBox(
            height: 600,
            child: ListView.builder(
              itemCount: products.length,
              padding: EdgeInsets.all(20),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
                final product = products[index];
                return MyProductTile(product: product);
              },
            ),
          )
        ],
      ),
    );
  }
}
