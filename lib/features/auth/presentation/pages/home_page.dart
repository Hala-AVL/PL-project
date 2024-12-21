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
    double height = MediaQuery.of(context).size.height ;
    double width = MediaQuery.of(context).size.width ;
    return Scaffold(
      backgroundColor: flexTheme.colorScheme?.primary,
      appBar: AppBar(
        title:  Text('Home' , style: flexTheme.textTheme?.bodyMedium,),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body:ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text("  Top Demanded Stores  " , style: flexTheme.textTheme?.bodySmall,),
          ) ,
          SizedBox(
            height: 170,
            child:  CarouselSlider.builder(itemCount: info.length,
                itemBuilder:(context , index , realIndex){
              return Container(
                width: width*0.68 ,
                height:  height*0.5 ,
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(20) ,
                  image: const DecorationImage(
                      image: AssetImage("assets/splash/Posters/HarryPotter1.jpg" , ) ,
                    fit: BoxFit.fill
                  ) ,

                ),
              ) ;
                },
                options: CarouselOptions(
                  autoPlay: true ,
                )),
            
            
          ) ,
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text("Top Demanded Products  " , style: flexTheme.textTheme?.bodySmall,),
          ) ,
          SizedBox(
            height: 170,
            child:  CarouselSlider.builder(itemCount: info.length,
                itemBuilder:(context , index , realIndex){
                  return Container(
                    width: width*0.68 ,
                    //height:  height/8 ,
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(20) ,
                      image: const DecorationImage(
                          image: AssetImage("assets/splash/Posters/Dragon.jpg" , ) ,
                          fit: BoxFit.fill
                      ) ,

                    ),
                  ) ;
                },
                options: CarouselOptions(
                  autoPlay: true ,
                )),

          ) ,
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(" Latest Products   " , style: flexTheme.textTheme?.bodySmall,),
          ) ,
          SizedBox(
            height: 400,
            child: GridView.builder(
              //physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2 ,
                mainAxisSpacing: 10 ,
                crossAxisSpacing: 15
              ),
              itemCount: 10,
                itemBuilder: (context , index){
              return Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    height: 100 ,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey
                    ),
                    child: Center(
                        child: Text("$index")),
                  ),
                  Positioned(
                    right: 0,
                      left: 150,
                      child: Stack(
                        children: [
                          IconButton(onPressed: (){},
                              icon: const Icon(Icons.favorite_border_outlined ,
                                size: 30,
                                color: Colors.black,)
                          ),
                         const Positioned(
                           top : 20,
                             //left : 20,
                             right : 0,
                             child:  Icon(Icons.add , size: 20,
                             )
                         )
                        ],
                      )
                  ) ,
                ],
              ) ;
            }),
          )

        ],
      )


    );
  }
}
/*
*  Column(
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
         
          // ListView.builder(
          //   itemCount: info.length,
          //     itemBuilder: (context , i){
          //   return
          //   ),
          //   ) ;
          // }) ,
          //
        ],
      ),*/