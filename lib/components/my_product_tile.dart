import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_net/models/product.dart';
import 'package:shop_net/models/shop.dart';

class MyProductTile extends StatelessWidget {
  final Product product;
  const MyProductTile({
    super.key,
    required this.product
  });

  void AddtoCart(BuildContext context){
    showDialog(
        context: context,
        builder: (context)=> AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
          content: Text("Are you sure you want to add this item to the cart?",
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
              context.read<Shop>().AddToCart(product);
            },
              child: Text("Add",style: GoogleFonts.syne(),),)
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(15)
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    width: double.infinity,
                    padding: EdgeInsets.all(8),
                    child: Image.network(
                        product.images!,
                        fit: BoxFit.cover,)),
              ),
              SizedBox(height: 20),
              Text(product.name,style: GoogleFonts.syne(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ),),
              SizedBox(height: 10),
              Text(product.description,style: GoogleFonts.syne(),),
              SizedBox(height: 10),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(product.price.toStringAsFixed(2), style: GoogleFonts.syne(),),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: IconButton(
                    onPressed: ()=> AddtoCart(context),
                    icon: Icon(FontAwesomeIcons.add, size: 17,)),
              )
            ],
          )
        ],
      ),
    );
  }
}
