import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_delivery/apiexample/core/api/dio_consumer.dart';
import 'package:order_delivery/apiexample/user_repo/user_repositiry.dart';
import 'package:order_delivery/apiexample/usersbloc/user_cubit.dart';

import '../widgets/user_widget.dart';

void main() {
  runApp(const UsersScreen());
}


class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(UserRepository(api:  DioConsumer(dio: Dio())))..getUsers(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Users List "),
            backgroundColor: Colors.blue.shade900,
            centerTitle: true,
          ),
          body: BlocConsumer<UserCubit, UserState>(
            listener: (context, state) {
              if(state is GetUsersFailure){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errMsg))) ;
              }
            },
            builder: (context, state) {
              if (state is GetUsersSuccess) {
                return ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    //required user model from state
                    return UserWidget(userModel: state.users.users[index]);
                  },

                );
              } else if (state is GetUsersLoading) {
                return const Center(child:
                CircularProgressIndicator(color: Colors.blue,),
                );
              }
              return const Center(
                child: Text("No thing to show "),
              );
            },
          ),
        ),
      ),
    );
  }

}