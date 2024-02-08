
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_net/components/my_button.dart';
import 'package:shop_net/models/product.dart';
import 'package:shop_net/models/shop.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});

  void removeItemFromCart(BuildContext context, Product product){
    showDialog(
        context: context,
        builder: (context)=> AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
          content: Text("Are you sure you want to remove this item from the cart?",
            style: GoogleFonts.syne(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),),
          actions: [
            MaterialButton(onPressed: ()=> Navigator.pop(context),
                child: Text("Cancel",style: GoogleFonts.syne(),)),
            MaterialButton(onPressed: (){
              Navigator.pop(context);
              context.read<Shop>().RemovefromCart(product);
            },
              child: Text("Remove",style: GoogleFonts.syne(),),)
          ],
        ));
  }
  void payProduct(BuildContext context){
      showDialog(
          context: context,
          builder: (context)=>AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
            ),
            content: Text("User wants to pay!, Connect the app to your payment backend!"),
          ));
  }


  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("M Y  C A R T",
        style: GoogleFonts.syne(),),
      ),
      body: Column(
        children: [
          Expanded(
              child: cart.isEmpty
                  ? Center(child: Text("Cart is empty!",style: GoogleFonts.syne(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),))
                  : ListView.builder(itemCount: cart.length,
                itemBuilder: (context, index){
                  final item = cart[index];
                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text(item.price.toStringAsFixed(2)),
                    trailing: IconButton(
                      icon: Icon(FontAwesomeIcons.minus),
                      onPressed: ()=> removeItemFromCart(context, item),
                    ),
                  );
                },
              )),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: MyButton(
                onTap: ()=>payProduct(context),
                child: Text("Buy Now",style: GoogleFonts.syne(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inversePrimary
                ),)),
          ),
        ],
      ),
    );
  }
}
