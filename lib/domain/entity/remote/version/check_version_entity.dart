import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_crew/domain/entity/remote/version/version_entity.dart';

part 'check_version_entity.freezed.dart';
part 'check_version_entity.g.dart';

@freezed
abstract class CheckVersionEntity with _$CheckVersionEntity {
  const factory CheckVersionEntity({
    @Default(AppVersionEntity()) AppVersionEntity appVersion,
    @Default('') String currentVersion,
    @Default('') String lastestVersion,
    @Default('') String storeUrl,
    @Default(false) bool needUpdate,
  }) = _CheckVersionEntity;

  factory CheckVersionEntity.fromJson(Map<String, Object?> json) =>
      _$CheckVersionEntityFromJson(json);
}