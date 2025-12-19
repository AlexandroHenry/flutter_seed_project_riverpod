import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_params.freezed.dart';
part 'login_params.g.dart';

@freezed
sealed class LoginParams with _$LoginParams {
  const factory LoginParams({
    @Default('') String id,
    @Default('') String password,
  }) = _LoginParams;

  factory LoginParams.fromJson(Map<String, Object?> json) =>
      _$LoginParamsFromJson(json);
}