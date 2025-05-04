
import 'package:order_delivery/apiexample/core/api/api_consumer.dart';
import 'package:order_delivery/apiexample/models/user_model.dart';
import 'package:order_delivery/apiexample/core/api/end_points.dart';
import 'package:fpdart/fpdart.dart';
import 'package:order_delivery/halaCore/error/exceptions.dart';
// import 'package:order_delivery/halaCore/error/error_model.dart' ;

//import '../core/errors/errors.dart';

class UserRepository {
  final ApiConsumer api;

  UserRepository({required this.api});

  Future<Either<String, Users>> getUsers() async {
    try {
      final response = await api.get(
          EndPoints.getUsers
      );
      return Right(Users.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  // Future<Either<String, SignInModel>> signIn({
  //   required String email,
  //   required String password,
  // }) async {
  //   try {
  //     final response = await api.post(
  //       EndPoint.signIn,
  //       data: {
  //         ApiKey.email: email,
  //         ApiKey.password: password,
  //       },
  //     );
  //     final user = SignInModel.fromJson(response);
  //     final decodedToken = JwtDecoder.decode(user.token);
  //     CacheHelper().saveData(key: ApiKey.token, value: user.token);
  //     CacheHelper().saveData(key: ApiKey.id, value: decodedToken[ApiKey.id]);
  //     return Right(user);
  //   } on ServerException catch (e) {
  //     return Left(e.errModel.errorMessage);
  //   }
  // }
  //
  // Future<Either<String, SignUpModel>> signUp({
  //   required String name,
  //   required String phone,
  //   required String email,
  //   required String password,
  //   required String confirmPassword,
  //   required XFile profilePic,
  // }) async {
  //   try {
  //     final response = await api.post(
  //       EndPoint.signUp,
  //       isFromData: true,
  //       data: {
  //         ApiKey.name: name,
  //         ApiKey.phone: phone,
  //         ApiKey.email: email,
  //         ApiKey.password: password,
  //         ApiKey.confirmPassword: confirmPassword,
  //         ApiKey.location:
  //         '{"name":"methalfa","address":"meet halfa","coordinates":[30.1572709,31.224779]}',
  //         ApiKey.profilePic: await uploadImageToAPI(profilePic)
  //       },
  //     );
  //     final signUPModel = SignUpModel.fromJson(response);
  //     return Right(signUPModel);
  //   } on ServerException catch (e) {
  //     return Left(e.errModel.errorMessage);
  //   }
  // }
  //
}