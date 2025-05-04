import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:order_delivery/core/util/lang/app_localizations.dart';
import 'package:order_delivery/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';

import '../../../features/order/presentation/pages/cart_page.dart';
import '../../../features/order/presentation/pages/favorite_page.dart';
import '../../../features/order/presentation/pages/search_page.dart';


AppBar homeAppBar(BuildContext context){
  return AppBar(
    backgroundColor: Theme.of(context).colorScheme.surface.withAlpha(150),
    foregroundColor: Colors.white,
    title: Text("SPEEDY SERVE" , style:  Theme.of(context).textTheme.bodyLarge,),
    centerTitle: true ,
    actions: [
      IconButton(onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const FavoritePage())) ;
      },
          icon: Icon(Icons.favorite , color: Theme.of(context).colorScheme.onTertiary,)) ,
      IconButton(onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const CartPage())) ;
      },
          icon: const Icon(Icons.card_travel ,)) ,
      BlocBuilder<AuthBloc, AuthState>(
  builder: (context, state) {
    if(state is LoggedinAuthState){
  return IconButton(onPressed: (){
  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SearchPage( user:state.user,))) ;
  },
  icon: const Icon(Icons.search ,));
  }
    return Container() ;
    }

)
    ],

  ) ;
}


void showSnackBar(BuildContext context, Color color, String text,
    [int delay = 3]) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text , style: Theme.of(context).textTheme.headlineSmall,),
      backgroundColor: color,
      duration: const Duration(seconds: 3)));
}

void showCustomAboutDialog(BuildContext context, String title, String content,
    [List<Widget>? actions, bool barrierDismissible = true]) {
  showDialog(
    barrierDismissible: barrierDismissible,
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title, style: Theme.of(context).textTheme.titleMedium),
        backgroundColor: Theme.of(context).colorScheme.surface,
        content: Text(
          content.tr(context),
          style: Theme.of(context).textTheme.bodySmall,
        ),
        actions: actions ??
            [
              MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: Theme.of(context).colorScheme.onTertiary,
                  child: Text(
                    //todo
                    "ok".tr(context),
                    style: Theme.of(context).textTheme.labelSmall,
                  )),
            ],
      );
    },
  );


}
//for orders errors
void showToastMsg(BuildContext context ,String msg ){
  showToast(msg.tr(context),
      backgroundColor: Colors.red.shade800,
       borderRadius: BorderRadius.circular(20),
       textStyle: const TextStyle(fontSize: 17 , fontWeight: FontWeight.w900 , color: Colors.white),
      context: context,
      animation: StyledToastAnimation.slideFromTopFade,
      reverseAnimation: StyledToastAnimation.slideToTopFade,
      position: const StyledToastPosition(
          align: Alignment.topCenter, offset: 0.1),
      startOffset: const Offset(0.0, -3.0),
      reverseEndOffset: const Offset(0.0, -3.0),
      duration: const Duration(seconds: 4),
      //Animation duration   animDuration * 2 <= duration
      animDuration: const Duration(seconds: 1),
      curve: Curves.fastLinearToSlowEaseIn,
      reverseCurve: Curves.fastOutSlowIn);
}

void showToastMsgForProcess(BuildContext context ,String msg){
  showToast(msg.tr(context),
      backgroundColor: Colors.white38,
      borderRadius: BorderRadius.circular(20),
      textStyle: const TextStyle(fontSize: 17 , fontWeight: FontWeight.w900 , color: Colors.white),
      context: context,
      animation: StyledToastAnimation.slideFromBottomFade,
      reverseAnimation: StyledToastAnimation.slideToBottomFade,
      position: const StyledToastPosition(
          align: Alignment.bottomCenter, offset: 0.9),
      startOffset: const Offset(0.0, 4.0),
      reverseEndOffset: const Offset(0.0, 4.0),
      duration: const Duration(seconds: 5),
      //Animation duration   animDuration * 2 <= duration
      animDuration: const Duration(seconds: 1),
      curve: Curves.fastLinearToSlowEaseIn,
      reverseCurve: Curves.fastOutSlowIn);
}





