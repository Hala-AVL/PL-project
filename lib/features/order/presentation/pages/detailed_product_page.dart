
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_delivery/core/util/lang/app_localizations.dart';
import 'package:order_delivery/features/auth/domain/enitities/user_entity.dart';
import 'package:order_delivery/features/auth/presentation/widgets/custom_error_widget.dart';
import 'package:order_delivery/features/order/domain/enitities/detailed_product.entity.dart';
import 'package:order_delivery/features/order/domain/enitities/product_entity.dart';
import 'package:order_delivery/features/order/domain/enitities/store_entity.dart';
import 'package:order_delivery/features/order/presentation/bloc/product_bloc/product_bloc.dart';
import 'package:order_delivery/injection_container.dart' as di ;

import '../../../../core/util/functions/functions.dart';
import '../widgets/custom_dialog_widget.dart';

class DetailedProductPage extends StatefulWidget{
  final ProductEntity product ;
  final UserEntity user ;
  const DetailedProductPage({super.key, required this.product, required this.user});

  @override
  State<DetailedProductPage> createState() {
    return _DetailedProduct() ;
  }

}

class _DetailedProduct extends State<DetailedProductPage>{
  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height ;
    double width = MediaQuery.of(context).size.width ;
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: _buildAppBar(context, "product details"),
      body: BlocProvider<ProductBloc>(
        create: (context) => di.sl<ProductBloc>()..add(GetDetailedProductEvent(token: widget.user.token, product: widget.product)),
          child:  BlocConsumer<ProductBloc, ProductState>(
               listener: (context, state) {
                  if(state is DoneOrderProductState){
                   showSnackBar(context, Colors.green.shade600, "done order") ;
                  }
                  if(state is FailedOrderProductState){
                    showToastMsg(context, "order err") ;
                  }
                  if(state is DoneAddProductToCartState){
                    showSnackBar(context, Colors.green.shade600, "done add to cart") ;
                  }
                  if(state is FailedAddProductToCartState){
                   showToastMsg(context, "add to cart err") ;
                  }
                  if(state is DoneAddProductToFavState){
                    showSnackBar(context, Colors.green.shade600, "done add to fav") ;
                  }
                  if(state is FailedAddProductToFavState){
                    showToastMsg(context, "add to fav err") ;
                  }
               },
            builder: (context, state) {
              if(state is LoadedDetailedProductState){
                return _buildBody(context, height, width , state.detailedProduct) ;
              }
              else if(state is FailedGetDetailedProductState){
                showCustomAboutDialog(context, "detailed product err", state.failure.failureMessage) ;
              }
              return const CustomErrorWidget();
            },
),
      ),
    );
  }
//_buildBody(context ,height , width )
  
  Widget _buildBody(BuildContext context , double height , double width, DetailedProductEntity detailedProduct ){
    String? appLang = widget.user.locale ;
     ProductEntity product = detailedProduct.product ;
     StoreEntity store = detailedProduct.store ;
     UserEntity user = widget.user ;
   return ListView(
      shrinkWrap: true,
      children: [
        Center(
          child: Stack(
            children: [
              _buildStorePicture(height, width, store.logo) ,
              _buildFilter(context, height, width, store.storeName)
            ],
          ),
        ) ,
        Padding(
          padding: const EdgeInsets.only(top: 30 , bottom: 15),
          child: SizedBox(
            height: height*0.4,
            //width: width*0.5,
            child: _buildPageView(context, height, width , product)
          ),
        ) ,
       SizedBox(
         child: Stack(
           children: [
             Padding(
               padding: const EdgeInsets.only(right: 10),
               child: ListTile(
                 title: _buildText(context, appLang == "en" ? product.englishName : product.arabicName,
                     Theme.of(context).textTheme.bodyMedium!),
                 subtitle: Text("${product.price}" ,
                   style: Theme.of(context).textTheme.titleSmall ,),
               ),
             ),
             Positioned(left: 0 ,
             child: _buildFavoriteButton(user.token , product.productId),)
           ],
         ),
       ),
        
        Padding(padding: const EdgeInsets.all(20) ,
          child: _buildText(context, appLang == "en" ? product.englishDescription : product.arabicDescription,
              Theme.of(context).textTheme.bodySmall!)
        ) ,
        Center(
          child: SizedBox(
            height: 50,
            child: Row(
              children: [
               CustomButtonWidget(title: "Order", user: user, product: product),

                CustomButtonWidget(title: "Add to cart", user: user, product: product),
              ],
            ),
          ),
        )

      ],
    );
  }


  AppBar _buildAppBar(BuildContext context , String title ){
    return AppBar(
      title:  Text(title.tr(context) , style : Theme.of(context).textTheme.bodyLarge),
      centerTitle: true,
      backgroundColor: Colors.black45,
      foregroundColor: Colors.white,
    );
  }


  Widget _buildText(BuildContext context , String text , TextStyle textStyle){
    return Text(text , style:  textStyle,);
  }


  Widget _buildStorePicture(double height , double width , String storeLogo){
    return  Container(
      width: width*0.99,
      height: height*0.3,
      decoration: BoxDecoration(
        color: Colors.grey.shade700,
        borderRadius: BorderRadius.circular(40) ,
        image:  DecorationImage(
            image: NetworkImage(storeLogo) ,
            fit: BoxFit.fill
        ) ,
      ),
    ) ;
  }


  Widget _buildFilter(BuildContext context , double height , double width , String storeName ){
    return Container(
      width: width*0.99,
      height: height*0.3,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20) ,
          color: Colors.black26
      ),
      child: Center(
        child: _buildText(context, storeName, Theme.of(context).textTheme.bodyLarge!),
      ),
    );
  }
  
  
  Widget _buildPageView(BuildContext context , double height , double width , ProductEntity product ){
    List<String> productsPic = product.productPictures ;
    return PageView.builder(
        itemCount: productsPic.length,
        itemBuilder: (context , index){
          String pic = productsPic[index] ;
          return  Center(
            child: Stack(
              children: [
                Container(
                  height: 300,
                  width: width*0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20) ,
                    image:  DecorationImage(
                        image:  NetworkImage(pic),
                        fit: BoxFit.fill
                    ) ,
                  ),

                ),
                Positioned(
                    left: 0 ,
                    top: 10,
                    child: Text(" ${index+1} /${productsPic.length}" , style: Theme.of(context).textTheme.bodySmall,))
              ],
            ),
          ) ;
        });
  }


  Widget _buildFavoriteButton(String token , String productID){
    return IconButton(onPressed: (){
      context.read<ProductBloc>().add(AddProductToFavEvent(token: token, productId: productID)) ;
    },
        icon:  Icon(Icons.favorite_border_outlined , color: Colors.greenAccent.shade700, size:  35,)
    ) ;
  }
  
}
