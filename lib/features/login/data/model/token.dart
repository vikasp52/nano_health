// ignore_for_file: invalid_annotation_target

// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

part 'token.freezed.dart';
part 'token.g.dart';

@freezed
class Token with _$Token {
  const factory Token({
    required String token,
  }) = _Token;

  factory Token.fromJson(Map<String, Object?> json) =>
      _$TokenFromJson(json);
}
