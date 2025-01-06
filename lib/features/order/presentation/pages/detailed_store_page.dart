
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_delivery/core/util/lang/app_localizations.dart';
import 'package:order_delivery/features/auth/domain/enitities/user_entity.dart';
import 'package:order_delivery/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
//import 'package:order_delivery/features/auth/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:order_delivery/features/auth/presentation/widgets/costum_loading_widget.dart';
import 'package:order_delivery/features/auth/presentation/widgets/custom_error_widget.dart';
import 'package:order_delivery/features/order/domain/enitities/detailed_store_enitity.dart';
import 'package:order_delivery/features/order/domain/enitities/product_entity.dart';
import 'package:order_delivery/features/order/domain/enitities/store_entity.dart';
import 'package:order_delivery/features/order/presentation/bloc/detailed_store_pagination_bloc/detailed_store_pagination_bloc.dart';
//import 'package:order_delivery/features/order/presentation/bloc/search_store_pagination_bloc/store_pagination_bloc.dart';
import '../../../../core/util/functions/functions.dart';
import 'package:order_delivery/injection_container.dart' as di ;

class DetailedStorePage extends StatefulWidget{
   final String storeID ;
   final UserEntity user ;
   const DetailedStorePage({super.key, required this.storeID, required this.user}) ;

   
  @override
  State<DetailedStorePage> createState() {
     return _DetailedStore() ;
  }

}

class _DetailedStore extends State<DetailedStorePage>{
  final ScrollController _scrollC = ScrollController() ;
   static int pageNUM = 1 ;

  @override
  void initState() {
    _scrollC.addListener(_onScroll(context)) ;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    
    double height = MediaQuery.of(context).size.height ;
    double width = MediaQuery.of(context).size.width ;
    return BlocProvider<DetailedStorePaginationBloc>(
        create: (context) =>
        di.sl<DetailedStorePaginationBloc>()
          ..add(GetDetailedStoreEvent(token: widget.user.token, storeId: widget.storeID, pageNum: pageNUM)),

      child: BlocBuilder<DetailedStorePaginationBloc , DetailedStorePaginationState>(
          builder: (context , state ){
            if(state is LoadedDetailedStoreState){
              
             return _buildBody(context, height, width, state.detailedStore) ;
            }
            else if(state is LoadingStoreState && pageNUM == 1 ){
              
              return const CustomLoadingWidget() ;
            }
            else if (state is FailedStoreState){
              
              showCustomAboutDialog(context, "detailed store err".tr(context), state.failure.failureMessage) ;
            }
         return const CustomErrorWidget();
          }
      ),
    ) ;
  }


  Widget _buildBody( BuildContext context ,double height , double width ,DetailedStoreEntity storeDetails  ){
    final StoreEntity store = storeDetails.store ;
    final String picture = store.logo ;
    final String storeName = store.storeName ;
    final List<ProductEntity> products = storeDetails.products;
    //final int productsCount = products.length ;

    return Scaffold(
      backgroundColor: Colors.black87, // change
      appBar: _buildAppBar(context , "store details".tr(context)),
      body: ListView(
        shrinkWrap: true,
        children: [
          Center(
            child: Stack(
              children: [
                _buildPicture(height, width, picture),
                _buildFilter(context, height, width, storeName)
              ],
            ),
          ) ,
          Padding(
            padding: const EdgeInsets.all(20),
            //locate
            child: Text("store's product".tr(context) , style: Theme.of(context).textTheme.bodyMedium,),
          ) ,
         _buildStoreProducts(context, products)
        ],
      ),
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
    return Text(text.tr(context) , style:  textStyle,);
  }

  Widget _buildPicture(double height , double width , String storeLogo){
    return  Container(
      width: width*0.99,
      height: height*0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20) ,
        image:  DecorationImage(
            image:NetworkImage(storeLogo),
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


  Widget _buildStoreProducts(BuildContext context ,List<ProductEntity> products ){
    String appLang = "EN" ;
  return   BlocBuilder<AuthBloc, AuthState>(
  builder: (context, state) {
    if(state is LoggedinAuthState){
      if(state.user.locale != "en"){
        appLang = "AR" ;
      }
    }
    return SizedBox(
    height: 400,
    child: GridView.builder(
      //physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2 ,
            mainAxisSpacing: 15 ,
            crossAxisSpacing: 15
        ),
        itemCount: products.length,
        itemBuilder: (context , index){
          final product = products[index] ;
          return BlocBuilder<DetailedStorePaginationBloc, DetailedStorePaginationState>(
             builder: (context, state) {
               if(state is LoadingStoreState){
                 return  Center(
                   child:  CircularProgressIndicator(
                     color: Theme.of(context).colorScheme.tertiary,
                   ),
                 ) ;
               }
         return Stack(
            fit: StackFit.expand,
            children: [
              Container(
                  height: 100 ,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey ,
                    image:  DecorationImage(
                        image: NetworkImage(product.productPictures.first) ,
                        fit: BoxFit.fill
                    ) ,
                  ),
                  child:  Card(
                      color: Colors.grey.shade800,
                      margin: const EdgeInsets.only(top: 130),
                      child:  ListTile(
                        leading: const Icon(Icons.production_quantity_limits , size: 15, color: Colors.greenAccent,),
                        title: Text(appLang == "EN" ? product.englishName : product.arabicName ,
                          style:  TextStyle(fontSize: 12 ,fontFamily: "PlayfairDisplay", color: Theme.of(context).colorScheme.tertiary),),
                        subtitle: Text(appLang == "EN" ? product.englishDescription : product.arabicDescription
                            ,  maxLines: 2,
                            style: const TextStyle(fontSize: 10 , color: Colors.white54)),
                      )
                  )
              ),
              Positioned(
                  right: 0,
                  left: 150,
                  child: Stack(
                    children: [
                      IconButton(onPressed: (){},
                          icon: const Icon(Icons.favorite ,
                            size: 30,
                            color: Colors.grey,)
                      ),

                    ],
                  )
              ) ,
            ],
          );
  },
) ;
        }),
  );
  },
);

  }

  _onScroll(BuildContext context){
    final max  = _scrollC.position.maxScrollExtent ;
    final currentScroll = _scrollC.offset ;
    //todo
    // must be another condition
    if(currentScroll >= max*0.8 ){
      pageNUM++ ;
      context.read<DetailedStorePaginationBloc>().add(GetDetailedStoreEvent(token: widget.user.token, storeId: widget.storeID, pageNum: pageNUM)) ;
    }
    return currentScroll ;
  }

  @override
  void dispose() {
    _scrollC.dispose() ;
    super.dispose();
  }
  


}

