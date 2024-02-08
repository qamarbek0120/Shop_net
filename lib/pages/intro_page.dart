import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_net/components/my_button.dart';
class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              FontAwesomeIcons.cartShopping,
              size: 90,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            SizedBox(height: 25,),
            Text("ShopNet",
            style: GoogleFonts.syne(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 15,),
            Text("Buy, Sell and Enjoy",
            style: GoogleFonts.syne(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: 16,
              fontWeight: FontWeight.w500
            ),),
            SizedBox(height: 20,),
            MyButton(
                onTap: (){
                  Navigator.pushNamed(context, '/shop_page');
                },
                child: Icon(
                  FontAwesomeIcons.arrowRight,
                  size: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ))
          ],
        ),
      ),
    );
  }
}
