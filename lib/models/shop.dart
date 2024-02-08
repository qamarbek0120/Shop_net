import 'package:flutter/cupertino.dart';
import 'package:shop_net/models/product.dart';

class Shop extends ChangeNotifier{
  final List<Product> _shop = [
    Product(
        name: "Macbook Air",
        description: "Our most popular laptop, MacBook Air is supercharged by M1 and M2 chips..",
        price: 999.9,
        images: "https://media.wired.com/photos/64daad6b4a854832b16fd3bc/master/pass/How-to-Choose-a-Laptop-August-2023-Gear.jpg"),
    Product(
        name: "DELL XPS",
        description: "Our thinnest and lightest 13-inch XPS is built for a lifestyle on the move.",
        price: 990.99,
        images: "https://cdn.thewirecutter.com/wp-content/media/2023/06/businesslaptops-2048px-0943.jpg?auto=webp&quality=75&width=1024"),
    Product(
        name: "Lenovo",
        description: "Smarter Technology for All Smarter Technology for All. See how Lenovo's technology transforms the world",
        price: 599.99,
        images: "https://images.anandtech.com/doci/10113/XPS17.jpg"),
    Product(
        name: "Hp Spectre",
        description: "View all of our premium HP® Spectre Laptop Models. Enjoy Low Prices and Free Shipping when you buy now online at HP.com",
        price: 799.99,
        images: "https://cdn.vox-cdn.com/uploads/chorus_asset/file/24677165/236652_HP_Spectre_x360_14_AKrales_0138.jpg"),
  ];


  final List<Product> _cart = [];

  List<Product> get shop => _shop;

  List<Product> get cart => _cart;


  void AddToCart(Product product){
    _cart.add(product);
    notifyListeners();
  }
  void RemovefromCart(Product product){
    _cart.remove(product);
    notifyListeners();
  }
}