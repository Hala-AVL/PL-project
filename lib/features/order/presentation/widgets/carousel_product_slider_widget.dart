import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:order_delivery/features/order/domain/enitities/product_entity.dart';
import '../../../auth/domain/enitities/user_entity.dart';
import '../pages/detailed_product_page.dart';


class CarouselSliderProductWidget extends StatelessWidget{

  final List<ProductEntity> products ;
  final UserEntity user ;

  const CarouselSliderProductWidget({super.key, required this.products, required this.user});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height ;
    double width = MediaQuery.of(context).size.width ;
    return SizedBox(
      height: 130,
      child:  CarouselSlider.builder(
          itemCount: products.length,
          itemBuilder:(context , index , realIndex){
            ProductEntity product = products[index] ;
            return SafeArea(
              child: Stack(
                children: [
                  InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                          //TODO
                            builder: (context)=> DetailedProductPage(product: product, user: user,)
                        )) ;
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildProductPicture(height , width , index),
                           Center(
                             child: Text(user.locale == "en" ? product.englishName : product.arabicName ,
                               style: Theme.of(context).textTheme.titleSmall,),
                           )
                        ],
                      )  ,
                  ) ,
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

  Widget _buildProductPicture( double height , double width ,int  index){
    return Container(
      width: width*0.68 ,
      height:  height*0.5 ,
      decoration: BoxDecoration(
        color: Colors.greenAccent,
        borderRadius: BorderRadius.circular(50) ,
        image: DecorationImage(
            image: NetworkImage(products[index].productPictures.first) ,
            fit: BoxFit.fill
        ) ,

      ),
    ) ;
  }


}