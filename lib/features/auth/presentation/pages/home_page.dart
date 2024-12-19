import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:order_delivery/main.dart';

final List info =[
  {
    'name' : "Harry Potter 1" ,
    'details' : " was one of the top 10 students in every year of studying , I used to get the third degree , Iintend to complete master in a foreign universities .Damascus 2023-2027" ,
    'image' : "HarryPotter1.jpg"
  } ,
  {
    'name' : "Harry Potter 2" ,
    'details' : "" ,
    'image' : "HarryPotter2.jpg"
  } ,
  {
    'name' : "Harry Potter 3" ,
    'details' : "" ,
    'image' : "HarryPotter3.jpg"
  } ,
  {
    'name' : "Harry Potter 4" ,
    'details' : "" ,
    'image' : "HarryPotter4.jpg"
  } ,
  {
    'name' : "Harry Potter 5" ,
    'details' : "" ,
    'image' : "HarryPotter5.jpg"
  } ,
  {
    'name' : "Harry Potter 6" ,
    'details' : "" ,
    'image' : "HarryPotter6.jpg"
  } ,

  {
    'name' : "A Beautifulم Mind" ,
    'details' : " was one of the top 10 students in every year of studying , I used to get the third degree , Iintend to complete master in a foreign universities .Damascus 2023-2027" ,
    'image' : "ABeautifulMind.jpg"
  } ,
  {
    'name' : "Alexander" ,
    'details' : " was one of the top 10 students in every year of studying , I used to get the third degree , Iintend to complete master in a foreign universities .Damascus 2023-2027" ,
    'image' : "Alexander.jpg"
  } ,
  {
    'name' : "Alien" ,
    'details' : " was one of the top 10 students in every year of studying , I used to get the third degree , Iintend to complete master in a foreign universities .Damascus 2023-2027" ,
    'image' : "Alien.jpg"
  } ,
  {
    'name' : "Aqua Man" ,
    'details' : " was one of the top 10 students in every year of studying , I used to get the third degree , Iintend to complete master in a foreign universities .Damascus 2023-2027" ,
    'image' : "AquaMan.jpg"
  } ,
  {
    'name' : "Bridge" ,
    'details' : " was one of the top 10 students in every year of studying , I used to get the third degree , Iintend to complete master in a foreign universities .Damascus 2023-2027" ,
    'image' : "Bridge.jpg"
  } ,
  {
    'name' : "Candy Man" ,
    'details' : " was one of the top 10 students in every year of studying , I used to get the third degree , Iintend to complete master in a foreign universities .Damascus 2023-2027" ,
    'image' : "CandyMan.jpg"
  } ,
  {
    'name' : "Cobweb" ,
    'details' : " was one of the top 10 students in every year of studying , I used to get the third degree , Iintend to complete master in a foreign universities .Damascus 2023-2027" ,
    'image' : "Cobweb.jpg"
  } ,
  {
    'name' : "DjangoUnchained" ,
    'details' : " was one of the top 10 students in every year of studying , I used to get the third degree , Iintend to complete master in a foreign universities .Damascus 2023-2027" ,
    'image' : "DjangoUnchained.jpg"
  } ,
  {
    'name' : "Dragon" ,
    'details' : " was one of the top 10 students in every year of studying , I used to get the third degree , Iintend to complete master in a foreign universities .Damascus 2023-2027" ,
    'image' : "Dragon.jpg"
  } ,
  {
    'name' : "Fantastic Beasts1" ,
    'details' : " was one of the top 10 students in every year of studying , I used to get the third degree , Iintend to complete master in a foreign universities .Damascus 2023-2027" ,
    'image' : "FantasticBeasts1.jpg"
  } ,
  {
    'name' : "Fantastic Beasts2" ,
    'details' : " was one of the top 10 students in every year of studying , I used to get the third degree , Iintend to complete master in a foreign universities .Damascus 2023-2027" ,
    'image' : "FantasticBeasts2.jpg"
  } ,
  {
    'name' : "Fantastic Beasts3" ,
    'details' : " was one of the top 10 students in every year of studying , I used to get the third degree , Iintend to complete master in a foreign universities .Damascus 2023-2027" ,
    'image' : "FantasticBeasts3.jpg"
  } ,
  {
    'name' : "FastX" ,
    'details' : " was one of the top 10 students in every year of studying , I used to get the third degree , Iintend to complete master in a foreign universities .Damascus 2023-2027" ,
    'image' : "FastX.jpg"
  } ,
  {
    'name' : "Fight Club" ,
    'details' : " was one of the top 10 students in every year of studying , I used to get the third degree , Iintend to complete master in a foreign universities .Damascus 2023-2027" ,
    'image' : "FightClub.jpg"
  } ,
  {
    'name' : "KungFu Panda 2" ,
    'details' : " was one of the top 10 students in every year of studying , I used to get the third degree , Iintend to complete master in a foreign universities .Damascus 2023-2027" ,
    'image' : "KungFuPanda2.jpg"
  } ,
  {
    'name' : "Finding Nemo" ,
    'details' : " was one of the top 10 students in every year of studying , I used to get the third degree , Iintend to complete master in a foreign universities .Damascus 2023-2027" ,
    'image' : "FindingNemo.jpg"
  } ,
  {
    'name' : "Five Feet Apart" ,
    'details' : " was one of the top 10 students in every year of studying , I used to get the third degree , Iintend to complete master in a foreign universities .Damascus 2023-2027" ,
    'image' : "FiveFeetApart.jpg"
  } ,

];

void main (){
  runApp(const MaterialApp(home: HomePage(),)) ;
}
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: flexTheme.colorScheme?.primary,
      appBar: AppBar(
        title:  Text('Home' , style: flexTheme.textTheme?.bodyMedium,),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
       // physics: const NeverScrollableScrollPhysics(),
        children: [
          //Text("  Top Demanded Stores : " , style: flexTheme.textTheme?.bodySmall,) ,
          Expanded(
            child: CarouselSlider.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index, int realIndex) {
                    return Container(
                     // padding: const EdgeInsets.all(100),
                      margin: const EdgeInsets.all(20),
                      width: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20) ,
                        color: Colors.greenAccent
                      ),
                      child: Center(
                          child: Text("$index" , style: flexTheme.textTheme?.bodyLarge,)
                      ),
                    ) ;
                  },
                  options: CarouselOptions(
                    //autoPlay: true ,
                    enlargeStrategy: CenterPageEnlargeStrategy.height ,
                    enlargeCenterPage: true
                  ),

                ),
          ),
          Text("  Latest Products  " , style: flexTheme.textTheme?.bodySmall,) ,
          Column(
            children: [
    Container(width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/splash/Posters/KungFuPanda4.jpg") ,
            fit: BoxFit.cover
          )
          )) ]
          )
          // ListView.builder(
          //   itemCount: info.length,
          //     itemBuilder: (context , i){
          //   return
          //   ),
          //   ) ;
          // }) ,
          //
        ],
      ),


    );
  }
}
