import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_entity.freezed.dart';
part 'account_entity.g.dart';

@freezed
abstract class AccountEntity with _$AccountEntity {
  const factory AccountEntity({
    @Default('') String refreshToken,
    @Default('') String accessToken,
  }) = _AccountEntity;

  factory AccountEntity.fromJson(Map<String, Object?> json) =>
      _$AccountEntityFromJson(json);
}
