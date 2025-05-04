import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_delivery/core/util/functions/functions.dart';
import 'package:order_delivery/core/util/lang/app_localizations.dart';
import 'package:order_delivery/features/auth/domain/enitities/user_entity.dart';
import 'package:order_delivery/features/auth/presentation/widgets/custom_error_widget.dart';
import 'package:order_delivery/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:order_delivery/features/order/domain/enitities/product_entity.dart';
import 'package:order_delivery/features/order/domain/enitities/store_entity.dart';
import 'package:order_delivery/features/order/presentation/bloc/product_pagination_bloc/product_pagination_bloc.dart';
import 'package:order_delivery/features/order/presentation/bloc/search_store_pagination_bloc/store_pagination_bloc.dart';
import 'package:order_delivery/injection_container.dart' as di;
import '../bloc/search_product_pagination_bloc/search_product_pagination_bloc.dart';

class SearchPage extends StatefulWidget {
  final UserEntity user ;
  const SearchPage({super.key, required this.user});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController searchTEC = TextEditingController();
  final ScrollController scrollC = ScrollController() ;
  static int productPageNUM = 1  , storePageNUM = 1 ;
  static int currentIndex = 0 ;
  //static String query = "" ;


  @override
  void initState() {
    scrollC.addListener(_onScroll(context)) ;
    super.initState();
  }
  
  
  @override
  void dispose() {
    searchTEC.dispose();
    scrollC.dispose() ;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final UserEntity user = widget.user ;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Search Page"),
        ),
        body: MultiBlocProvider(
  providers: [
    BlocProvider(
  create: (context) => di.sl<ProductPaginationBloc>(),
),
    BlocProvider(
      create: (context) => di.sl<StorePaginationBloc>(),
    ),
  ],
  child: SizedBox(
          height: 0.9 * height,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Expanded(
                        flex: 5 ,
                        child: _buildSearchTextField() ,
                    ),
                    Expanded(flex: 1,
                      child: _buildSearchBtn(user.token) ,
                    )
                  ],
                ),
                Container(
                    height: 0.7 * height,
                    padding: const EdgeInsets.all(20),
                    child: _buildTabBars(height)
                ),
              ],
            ),
          ),
        ),
));
  }

  Widget _buildTabBars(double height) {
    return DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Column(children: [
          TabBar(
            onTap: (value){
              currentIndex = value ;
            },
              indicator: BoxDecoration(
                color: Theme.of(context).colorScheme.onTertiary,
                borderRadius: BorderRadius.circular(10.0),
              ),
              tabs:  [
                Tab(
                  icon:  Icon(
                    Icons.production_quantity_limits_outlined,
                    color: Colors.greenAccent.shade700,
                  ),
                  child: Text(
                    "products".tr(context),
                  ),
                ),
                Tab(
                  icon: const Icon(
                    Icons.store,
                    color: Colors.lightGreen,
                  ),
                  child: Text(
                    "stores".tr(context),
                  ),
                ),
              ]),
          Expanded(
            child: TabBarView(children: [
              _buildProductsTestWidgets(height),
              _buildStoresTestWidgets(height)
            ]),
          )
        ]));
  }

  Widget _buildSearchBtn(String token ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10.0),
      child: Row(
        children: [
          Expanded(
            child: MaterialButton(
              onPressed: () {
                if(formKey.currentState!.validate()){
                  context.read<SearchProductPaginationBloc>().add(
                      SearchProductsEvent(token: token, query: searchTEC.text , pageNum: 1)
                  ) ;
                  context.read<StorePaginationBloc>().add(
                      SearchStoresEvent(token: token, query: searchTEC.text, pageNum: 1)
                  ) ;
                }
              },
              height: 50,
              color: Colors.green,
              child: const Text("search"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchTextField() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: CustomTextFormField(
            obsecure: false,
            textEditingController: searchTEC,
            hintText: "enter your search query".tr(context),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "please enter your query to search".tr(context);
              }
              return null;
            },
            prefixIcon: const Icon(
              Icons.image_search,
              color: Colors.green,
              size: 40,
            )),
      ),
    );
  }

  Widget _buildProductsTestWidgets(double height) {
    List<ProductEntity> productsResults  = [];
    return BlocConsumer<SearchProductPaginationBloc, SearchProductPaginationState>(
  listener: (context, state) {
  },
  builder: (context, state) {
    if(state is LoadedSearchProductsState){
      productsResults = state.products ;
      return  _buildProductResults(context , productsResults);
    }
    else if(state is LoadingSearchProductsState && productPageNUM == 1 ){
      return CircularProgressIndicator(
        color:  Theme.of(context).colorScheme.secondary,
      ) ;
    }
    else if (state is FailedSearchProductsState && productPageNUM ==1 ){
      showCustomAboutDialog(context, "failed product search", state.failure.failureMessage) ;
    }
    return const CustomErrorWidget() ;
  },
);
  }

  Widget _buildStoresTestWidgets(double height ) {
    List<StoreEntity> storeResults = [] ;
    //String? appLang = widget.user.locale ;
    return BlocConsumer<StorePaginationBloc, StorePaginationState>(
  listener: (context, state) {
  },
  builder: (context, state) {
    if(state is LoadedSearchStoresState){
      storeResults = state.stores;
      return _buildStoreResults(context, storeResults) ;
    }
    else if(state is LoadingStoreState && storePageNUM == 1){
      return CircularProgressIndicator(
        color:  Theme.of(context).colorScheme.secondary,
      ) ;
    }
    else if (state is FailedStoreState && storePageNUM == 1){
      showCustomAboutDialog(context, "failed store search", state.failure.failureMessage) ;
    }
    return const CustomErrorWidget() ;
  },
);
  }

  Widget _buildProductResults(BuildContext context  , List<ProductEntity> products) {
    String? appLang = widget.user.locale;
    return SizedBox(
      height: 400,
      child: GridView.builder(
        //physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return BlocBuilder<SearchProductPaginationBloc, SearchProductPaginationState>(
              builder: (context, state) {
                if (state is LoadingSearchProductsState) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Theme
                          .of(context)
                          .colorScheme
                          .tertiary,
                    ),
                  );
                }
               else if(state is LoadedSearchProductsState){
                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey,
                            image: DecorationImage(
                                image: NetworkImage(product.productPictures
                                    .first),
                                fit: BoxFit.fill
                            ),
                          ),
                          child: Card(
                              color: Colors.grey.shade800,
                              margin: const EdgeInsets.only(top: 130),
                              child: ListTile(
                                leading: const Icon(Icons
                                    .production_quantity_limits, size: 15,
                                  color: Colors.greenAccent,),
                                title: Text(appLang == "EN"
                                    ? product.englishName
                                    : product.arabicName,
                                  style: TextStyle(fontSize: 12,
                                      fontFamily: "PlayfairDisplay",
                                      color: Theme
                                          .of(context)
                                          .colorScheme
                                          .tertiary),),
                                subtitle: Text(appLang == "EN" ? product
                                    .englishDescription : product
                                    .arabicDescription
                                    , maxLines: 2,
                                    style: const TextStyle(
                                        fontSize: 10, color: Colors.white54)),
                              )
                          )
                      ),
                      Positioned(
                          right: 0,
                          left: 150,
                          child: Stack(
                            children: [
                              IconButton(onPressed: () {},
                                  icon: const Icon(Icons.favorite,
                                    size: 30,
                                    color: Colors.grey,)
                              ),

                            ],
                          )
                      ),
                    ],
                  );
                }
               else if(state is FailedSearchProductsState){
                 showToastMsg(context, "could not refresh feed") ;
                }
               return const CustomErrorWidget();
              },
            );
          }),
    );
  }

  Widget _buildStoreResults(BuildContext context , List<StoreEntity> stores){
    //String? appLang = widget.user.locale;
    return SizedBox(
      height: 400,
      child: GridView.builder(
        //physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15
          ),
          itemCount: stores.length,
          itemBuilder: (context, index) {
            final store = stores[index];
            return BlocBuilder<SearchProductPaginationBloc, SearchProductPaginationState>(
              builder: (context, state) {
                if (state is LoadingSearchProductsState) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Theme
                          .of(context)
                          .colorScheme
                          .tertiary,
                    ),
                  );
                }
                else if(state is LoadedSearchProductsState){
                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey,
                            image: DecorationImage(
                                image: NetworkImage(store.logo),
                                fit: BoxFit.fill
                            ),
                          ),
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black38,
                        ),
                        child: Center(
                          child: Text(store.storeName ,
                            style: Theme.of(context).textTheme.bodySmall
                            ,),
                        ),
                      ),

                    ],
                  );
                }
                else if (state is FailedStoreState){
                  showToastMsg(context, "could not refresh feed") ;
                }
                return const CustomErrorWidget();
              },
            );
          }),
    );
  }

  
  _onScroll(BuildContext context){
    final double  max  = scrollC.position.maxScrollExtent ;
    final double currentScroll = scrollC.offset ;
    //todo
    // must be another condition
    if(currentScroll >= max*0.8 ){
      if(currentIndex == 0){
        productPageNUM++ ;
        context.read<SearchProductPaginationBloc>().add(SearchProductsEvent(pageNum: productPageNUM, token: widget.user.token, query: searchTEC.text)) ;
      }
      else {
        storePageNUM++ ;
        context.read<SearchProductPaginationBloc>().add(SearchProductsEvent(pageNum: storePageNUM, token: widget.user.token, query: searchTEC.text)) ;
      }
       }
    
  }
}
