import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:nano_health/features/login/data/data_source/login_data_source.dart';
import 'package:nano_health/features/login/data/model/login.dart';
import 'package:nano_health/features/login/data/model/token.dart';

class LoginRepository {
  final LoginDataSource _loginDataSource;
  LoginRepository(
    LoginDataSource loginDataSource,
  ) : _loginDataSource = loginDataSource;

  Future<Either<String, Token>> authorizedUser(Login login) async {
    try {
      final token = await _loginDataSource.authorizedUser(login);

      return Right(token);
    } on DioException catch (error) {
      if (error.response != null) {
        return Left(error.response?.data);
      }
      return const Left('Something went wrong');
    }
  }
}
