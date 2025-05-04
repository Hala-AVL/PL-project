import 'package:flutter/material.dart';

class CartPage extends StatefulWidget{
  const CartPage({super.key});

  @override
  State<CartPage> createState() {
    return _Cart() ;
  }

}

class _Cart extends  State<CartPage>{
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: ListView(
      //Cart
    )) ;
  }
}