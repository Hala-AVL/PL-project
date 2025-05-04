import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_delivery/signin.dart';
import 'package:order_delivery/user_cubit/user_cubit.dart';
// import 'package:happy_tech_mastering_api_with_flutter/cache/cache_helper.dart';
// import 'package:happy_tech_mastering_api_with_flutter/core/api/dio_consumer.dart';
// import 'package:happy_tech_mastering_api_with_flutter/cubit/user_cubit.dart';
import 'cache/cache_helper.dart';
import 'halaCore/api/dio_consumer.dart';
import 'package:order_delivery/halarepository/user_repo.dart';
// import 'package:happy_tech_mastering_api_with_flutter/repositories/user_repository.dart';
// import 'package:happy_tech_mastering_api_with_flutter/screens/sign_in_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  runApp(
    BlocProvider(
      create: (context) =>
          UserCubit(UserRepository(api: DioConsumer(dio: Dio()))),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Api(),
    );
  }
}
