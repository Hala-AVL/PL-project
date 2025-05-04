import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:order_delivery/apiexample/models/user_model.dart';
import 'package:order_delivery/apiexample/user_repo/user_repositiry.dart';
// import 'package:order_delivery/halaCore/error/error_model.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.userRepository) : super(UserInitial());
  final UserRepository userRepository ;


  getUsers() async {
    emit(GetUsersLoading());
    final response = await userRepository.getUsers();
    response.fold(
          (errMsg) => emit(GetUsersFailure(errMsg: errMsg)),
          (users) => emit(GetUsersSuccess(users: users)),
    );
  }
}
