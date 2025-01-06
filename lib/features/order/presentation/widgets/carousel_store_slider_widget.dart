
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:order_delivery/features/auth/domain/enitities/user_entity.dart';
import 'package:order_delivery/features/order/presentation/pages/detailed_store_page.dart';
import '../../domain/enitities/store_entity.dart';




class CarouselSliderStoreWidget extends StatelessWidget{

  final List<StoreEntity> stores ;
  final UserEntity user ;

  const CarouselSliderStoreWidget({super.key, required this.stores, required this.user});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height ;
    double width = MediaQuery.of(context).size.width ;
   return SizedBox(
     height: 150,
     child:  CarouselSlider.builder(
         itemCount: stores.length,
         itemBuilder:(context , index , realIndex){
           StoreEntity store = stores[index] ;
           return SafeArea(
             child: Stack(
               children: [
                 _buildStorePicture(height , width , index)  ,
                 InkWell(
                   onTap: (){
                     Navigator.of(context).push(MaterialPageRoute(
                       //TODO
                         builder: (context)=> DetailedStorePage(storeID: store.storeId, user: user,)
                     )) ;
                   },
                   child: _buildFilter(height, width)
                 ) ,
                 Center(
                   child: Text(stores[index].storeName , style: Theme.of(context).textTheme.bodyLarge,),
                 )
               ],
             ),
           ) ;
         },
         options: CarouselOptions(
             autoPlay: true ,
             enableInfiniteScroll: true ,
             enlargeStrategy: CenterPageEnlargeStrategy.height
         )
     ),


   )  ;
  }
  
  Widget _buildStorePicture( double height , double width ,int  index){
    return Container(
      width: width*0.68 ,
      height:  height*0.6 ,
      decoration: BoxDecoration(
        color: Colors.greenAccent,
        borderRadius: BorderRadius.circular(50) ,
        image: DecorationImage(
            image: NetworkImage(stores[index].logo) ,
            fit: BoxFit.fill
        ) ,

      ),
    ) ;
  }
  
  Widget _buildFilter( double height , double width ){
    return Container(
      width: width*0.68 ,
      height:  height*0.6 ,
      decoration: BoxDecoration(
          color: Colors.black45,
          borderRadius: BorderRadius.circular(50) ,
          backgroundBlendMode: BlendMode.colorBurn
      ),
    ) ;
  }

}