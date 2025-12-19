import 'package:freezed_annotation/freezed_annotation.dart';

part 'refresh_token_params.freezed.dart';
part 'refresh_token_params.g.dart';

@freezed
sealed class RefreshTokenParams with _$RefreshTokenParams {
  const factory RefreshTokenParams({
    @Default('') String refreshToken,
  }) = _RefreshTokenParams;

  factory RefreshTokenParams.fromJson(Map<String, Object?> json) =>
      _$RefreshTokenParamsFromJson(json);
}