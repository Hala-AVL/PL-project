import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget{
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() {
    return _Favourites() ;
  }

}

class _Favourites extends  State<FavoritePage>{
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: ListView(
      //favorites
    )) ;
  }
}