import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:order_delivery/core/util/lang/app_localizations.dart';
import 'package:order_delivery/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:order_delivery/features/auth/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:order_delivery/features/auth/presentation/pages/home_page.dart';
import 'package:order_delivery/features/auth/presentation/pages/login_page.dart';
import 'package:order_delivery/features/auth/presentation/pages/update_profile_page.dart';
import 'injection_container.dart' as di;



 final TextEditingController controller = TextEditingController() ;
 GlobalKey<FormState> signupformkey = GlobalKey() ;
GlobalKey<FormState> loginformkey = GlobalKey() ;
GlobalKey<FormState> updateformkey = GlobalKey() ;
String phonepattern = r'(^(\([0-9]{3}\)|[0-9]{3}-)[0-9]{3}-[0-9]{4}$)';
RegExp numberExp = RegExp(phonepattern) ;

const flexTheme = FlexColorScheme(
    brightness: Brightness.dark,
    colorScheme:  ColorScheme.dark(brightness: Brightness.dark , primary: Colors.black) ,
    textTheme:  TextTheme(
      headlineMedium: TextStyle(fontWeight: FontWeight.w500 , fontSize: 18 , color: Colors.white ),
      displayMedium: TextStyle(fontWeight: FontWeight.w900 , fontSize: 16 ,fontFamily: "PlayfairDisplay", letterSpacing: 2),
      displaySmall: TextStyle(fontWeight: FontWeight.w500 , fontSize: 16 , color: Colors.white ),
        bodyMedium: TextStyle(fontSize: 25 ,letterSpacing: 2, fontWeight: FontWeight.w800 ,fontFamily: "PlayfairDisplay" , color: Colors.white)  ,
        bodyLarge: TextStyle(fontSize: 30 , fontWeight: FontWeight.bold ,fontFamily: "PlayfairDisplay", color: Colors.white , letterSpacing: 2)  ,
        bodySmall:  TextStyle(fontSize: 17 , fontWeight: FontWeight.w500 ,fontFamily: "PlayfairDisplay" , color: Colors.white),
      labelSmall: TextStyle(fontSize: 17 , fontWeight: FontWeight.w500 ,fontFamily: "PlayfairDisplay" , color: Colors.white70),
    )

) ;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();
  runApp(const MaterialApp( home: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
  providers: [
    BlocProvider<AuthBloc>(
      create: (context) => di.sl<AuthBloc>()..add(DefineCurrentStateEvent()),
),
    BlocProvider(
      create: (context) => di.sl<UserBloc>(),
    ),
  ],
  child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          String? appLocal;
          Widget homePage = const LoginPage();
          if (state is LoadingAuthState) {
            return const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                  body: Center(
                child: CircularProgressIndicator(),
              )),
            );
          } else if (state is LoggedinAuthState) {
            // if user is logged in but profile data doesn't exist show update profile page
            if (state.user.firstName == null) {
              homePage =  UpdateProfilePage();
            } else {
              homePage = const HomePage();
            }
            final userLocale = state.user.local;
            if (userLocale != null) {
              appLocal = userLocale;
            }
          }
          return MaterialApp(
              locale: appLocal == null ? null : Locale(appLocal),
              supportedLocales: AppLocalizations.supportedLocals,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate
              ],
              localeResolutionCallback: appLocal == null
                  ? (locale, supportedLocales) =>
                      _getDefaultLocale(locale, supportedLocales)
                  : null,
              debugShowCheckedModeBanner: false,
              home: homePage);
        },
      ),
);
  }

  Locale? _getDefaultLocale(locale, supportedLocales) {
    for (var l in supportedLocales) {
      if (locale != null && locale.languageCode.contains( l.languageCode)) {
        return l;
      }
    }
    return supportedLocales.first;
  }
}
