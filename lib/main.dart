
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_net/models/shop.dart';
import 'package:shop_net/pages/cart_page.dart';
import 'package:shop_net/pages/intro_page.dart';
import 'package:shop_net/pages/shop_page.dart';
import 'package:shop_net/themes/light_mode.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
        create: (context)=> Shop(),
    child: MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightMode,
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      routes: {
        '/intro_page':(context)=> const IntroPage(),
        '/shop_page':(context)=> const ShopPage(),
        '/cart_page':(context)=> CartPage(),
      },
    );
  }
}
