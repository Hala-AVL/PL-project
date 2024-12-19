import 'dart:math';

import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
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
  runApp( MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => di.sl<AuthBloc>()..add(DefineCurrentStateEvent()),
        ),
        BlocProvider(
          create: (context) => di.sl<UserBloc>(),
        ),
      ], child: const MaterialApp(
      home:MyApp()
  )
  )
  ) ;
}
// MaterialApp(home:MyApp())
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildSplashScreen(context) ;
  }

  Locale? _getDefaultLocale(locale, supportedLocales) {
    for (var l in supportedLocales) {
      if (locale != null && locale.languageCode.contains( l.languageCode)) {
        return l;
      }
    }
    return supportedLocales.first;
  }
  Widget _buildSplashScreen(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => di.sl<AuthBloc>()..add(DefineCurrentStateEvent()),
          ),
          BlocProvider(
            create: (context) => di.sl<UserBloc>(),
          ),
        ], child: FlutterSplashScreen.fadeIn(
      animationDuration: const Duration(seconds: 5),
      duration: const Duration(seconds: 5),
      childWidget: SizedBox(
          height: 0.5 * height,
          width: 0.7 * width,
          child: Padding(
            padding: EdgeInsets.only(left: 0.04 * width),
            child: const Icon(Icons.delivery_dining_outlined ),
          )),
      nextScreen: _handelNextScreen(context),
      backgroundImage: _buildPicture(height, width),
    )
        ) ;

  }

  Widget _handelNextScreen(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        String? appLocal;
        Widget nextScreen = const LoginPage();
        if (state is LoggedinAuthState) {
          if (state.user.firstName == null) {
            nextScreen =  const UpdateProfile() ;
          } else {
            nextScreen = const HomePage();
          }
          final userLocale = state.user.local;
          if (userLocale != null) {
            appLocal = userLocale;
          }
        } else if (state is LoadingAuthState) {
          nextScreen = const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                )),
          );
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
            home: nextScreen);
      },
    );
  }

  Image _buildPicture(double height, double width) {
    return Image.asset(
      'assets/splash/Posters/splash.jpg',
      fit: BoxFit.cover,
      height: height,
      width: width,
    );
  }

  int getRandomIntFromRange(int min, int max) {
    final random = Random() ;
    return min + random.nextInt(max - min) ;
  }
}





/*
* void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();
  runApp(BlocProvider<UserBloc>(
    create: (context) => di.sl<UserBloc>()..add(GetUserDataEvent()),
    child: MaterialApp(
        theme: appTheme,
        debugShowCheckedModeBanner: false,
        home: const MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildSplashScreen(context);
  }

  Widget _buildSplashScreen(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return FlutterSplashScreen.fadeIn(
      animationDuration: const Duration(seconds: 5),
      duration: const Duration(seconds: 5),
      childWidget: SizedBox(
          height: 0.5 * height,
          width: 0.7 * width,
          child: Padding(
            padding: EdgeInsets.only(left: 0.04 * width),
            child: Image.asset(LOADING3_PATH),
          )),
      nextScreen: _handelNextScreen(),
      backgroundImage: _buildPicture(height, width),
    );
  }

  Widget _handelNextScreen() {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        Widget nextScreen = const Placeholder();
        if (state is UserLoadedState) {
          nextScreen = const MoviesListsPage();
        } else if (state is UserLoadingState) {
          nextScreen = const Scaffold(body: LoadingWidget());
        } else if (state is UserErrorState) {
          nextScreen = SignUpPage();
        } else if (state is UserStoredState) {
          nextScreen = const MoviesListsPage();
        }
        return nextScreen;
      },
    );
  }

  Image _buildPicture(double height, double width) {
    return Image.asset(
      'assets/pngs/background${getRandomIntFromRange(1, 15)}.png',
      fit: BoxFit.cover,
      height: height,
      width: width,
    );
  }
}*/








/*MultiBlocProvider(
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
              homePage =  const UpdateProfile() ;
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
);*/































