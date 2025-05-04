part of 'user_cubit.dart';

sealed class UserState extends Equatable {}

final class UserInitial extends UserState {
  @override
  List<Object?> get props => [];
}
final class GetUsersLoading extends UserState{
  @override
  List<Object?> get props => [];
}

final class GetUsersFailure extends UserState{
  final String errMsg ;
  GetUsersFailure({required this.errMsg}) ;

  @override
  List<Object?> get props => [errMsg];
}

final class GetUsersSuccess extends UserState{
   final Users users ;
  GetUsersSuccess({required this.users}) ;

  @override
  List<Object?> get props => [users];
}
