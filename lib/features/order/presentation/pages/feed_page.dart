import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_delivery/core/util/functions/functions.dart';
import 'package:order_delivery/core/util/lang/app_localizations.dart';
import 'package:order_delivery/features/auth/domain/enitities/user_entity.dart';
import 'package:order_delivery/features/auth/presentation/widgets/custom_error_widget.dart';
import 'package:order_delivery/features/order/presentation/bloc/product_bloc/product_bloc.dart';
import 'package:order_delivery/features/order/presentation/bloc/product_pagination_bloc/product_pagination_bloc.dart';
import 'package:order_delivery/features/order/presentation/bloc/store_bloc/store_bloc.dart';
import 'package:order_delivery/features/order/presentation/widgets/carousel_product_slider_widget.dart';
import 'package:order_delivery/features/order/presentation/widgets/carousel_store_slider_widget.dart';
import 'package:order_delivery/injection_container.dart' as di;
import '../../domain/enitities/product_entity.dart';
class FeedPage extends StatefulWidget {
  final UserEntity user;

  const FeedPage({super.key, required this.user});

  @override
  State<StatefulWidget> createState() {
     return _FeedPage() ;
  }


}

class _FeedPage extends State<FeedPage>{
  final ScrollController _scrollC = ScrollController() ;
  static int pageNUM = 1 ;

  @override
  void initState() {
    _scrollC.addListener(_onScroll(context)) ;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserEntity user = widget.user ;
    String token = user.token ;
    return Scaffold(
      appBar: homeAppBar(context),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => di.sl<StoreBloc>()
              ..add(GetRandomStoresEvent(token: token)),
          ),
          BlocProvider(
            create: (context) => di.sl<ProductBloc>()
              ..add(GetTopDemandProductsEvent(token: token))
              ..add(GetTopDemandProductsEvent(token: token)),
          ),
          BlocProvider(
            create: (context) => di.sl<ProductPaginationBloc>()..add(GetRandomProductsEvent(pageNum: 0, token: token)),
          ),
        ],
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              return Column(
                // spacing: 100,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<StoreBloc, StoreState>(
                    builder: (context, state) {
                      if(state is LoadedRandomStoresState){
                        return CarouselSliderStoreWidget(stores: state.stores, user: user);
                      }
                      // else if (state is LoadingStoreState){
                      //  return CircularProgressIndicator(
                      //    color:  Theme.of(context).colorScheme.tertiary,
                      //  ) ;
                      // }
                      else if (state is FailedStoreState){
                        //todo
                        return const Text("Failed to get Stores") ;
                      }
                      return const CustomErrorWidget() ;
                    },

                  ) ,
                  _buildSubTitle(context, "top demanded"),
                  BlocBuilder<ProductBloc, ProductState>(
                    builder: (context, state) {
                      if(state is LoadedTopDemandProductsState){
                        return CarouselSliderProductWidget(products: state.products, user: user);
                      }
                      return const Text("Error") ;
                    },
                  ) ,
                  Text("Top Demand Products"),
                  Text("Latest Products"),
                  Text("Products For you"),

                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Text _buildSubTitle(BuildContext context, String title) {
    return Text(title.tr(context) , style: Theme.of(context).textTheme.bodySmall ,);
  }


  Widget _buildRandomProducts(BuildContext context ,List<ProductEntity> products ){
    String? appLang = widget.user.locale;
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
            return BlocBuilder<ProductPaginationBloc, ProductPaginationState>(
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


  }

  _onScroll(BuildContext context){
    final max  = _scrollC.position.maxScrollExtent ;
    final currentScroll = _scrollC.offset ;
    //todo
    // must be another condition
    if(currentScroll >= max*0.8 ){
      pageNUM++ ;
      context.read<ProductPaginationBloc>().add(GetRandomProductsEvent(pageNum: pageNUM, token: widget.user.token)) ;
    }
    return currentScroll ;
  }
}





