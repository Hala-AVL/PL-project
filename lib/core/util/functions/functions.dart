import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:order_delivery/core/util/lang/app_localizations.dart';

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
                  color: Theme.of(context).colorScheme.secondary,
                  child: Text(
                    //todo
                    "ok".tr(context),
                    style: Theme.of(context).textTheme.titleSmall,
                  )),
            ],
      );
    },
  );


}

void showToastMsg(BuildContext context ,String msg ){
  showToast(msg.tr(context),
      backgroundColor: Colors.red.shade800,
       borderRadius: BorderRadius.circular(20),
       textStyle: const TextStyle(fontSize: 17 , fontWeight: FontWeight.w900 , color: Colors.white),
      context: context,
      animation: StyledToastAnimation.slideFromTopFade,
      reverseAnimation: StyledToastAnimation.slideToTopFade,
      position: const StyledToastPosition(
          align: Alignment.topCenter, offset: 0.0),
      startOffset: const Offset(0.0, -3.0),
      reverseEndOffset: const Offset(0.0, -3.0),
      duration: const Duration(seconds: 4),
      //Animation duration   animDuration * 2 <= duration
      animDuration: const Duration(seconds: 3),
      curve: Curves.fastLinearToSlowEaseIn,
      reverseCurve: Curves.fastOutSlowIn);
}




