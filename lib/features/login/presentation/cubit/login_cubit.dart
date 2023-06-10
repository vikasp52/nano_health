// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nano_health/features/login/data/model/model.dart';
import 'package:nano_health/features/login/data/repository/login_repository.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(
    this.loginRepository,
  ) : super(const LoginState.initial());

  final LoginRepository loginRepository;

  Future<void> authorizedUser({
    required String userName,
    required String password,
  }) async {
    emit(const LoginState.loading());
    //final secureStorage = serviceLocator<SecureStorage>();

    final loginRequest = Login(
      username: userName,
      password: password,
    );

    final validate = await loginRepository.authorizedUser(loginRequest);

    validate.fold(
      (l) => emit(LoginState.error(
        l,
      )),
      (r) async {
        // secureStorage.writeValue(
        //   key: kAccessToken,
        //   value: r.accessToken,
        // );
        // secureStorage.writeValue(
        //   key: kRefreshToken,
        //   value: r.refreshToken,
        // );
        emit(const LoginState.validated());
      },
    );
  }
}
