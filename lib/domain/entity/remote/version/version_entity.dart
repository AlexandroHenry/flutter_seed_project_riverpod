import 'package:freezed_annotation/freezed_annotation.dart';

part 'version_entity.freezed.dart';
part 'version_entity.g.dart';

@freezed
abstract class VersionEntity with _$VersionEntity {
  const factory VersionEntity({
    @Default(AppVersionEntity()) AppVersionEntity appVersion,
  }) = _VersionEntity;

  factory VersionEntity.fromJson(Map<String, Object?> json) =>
      _$VersionEntityFromJson(json);
}

@freezed
abstract class AppVersionEntity with _$AppVersionEntity {
  const factory AppVersionEntity({
    @Default('') String androidVersion,
    @Default(false) bool androidForceUpdate,
    @Default('') String androidReason,
    @Default('') String iosVersion,
    @Default(false) bool iosForceUpdate,
    @Default('') String iosReason,
  }) = _AppVersionEntity;

  factory AppVersionEntity.fromJson(Map<String, Object?> json) =>
      _$AppVersionEntityFromJson(json);
}
