// ignore_for_file: invalid_annotation_target

// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login.freezed.dart';
part 'login.g.dart';

@freezed
class Login with _$Login {
  const factory Login({
    required String username,
    required String password,
  }) = _Login;

  factory Login.fromJson(Map<String, Object?> json) =>
      _$LoginFromJson(json);
}
