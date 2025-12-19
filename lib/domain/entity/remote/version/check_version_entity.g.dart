// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_version_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CheckVersionEntity _$CheckVersionEntityFromJson(Map<String, dynamic> json) =>
    _CheckVersionEntity(
      appVersion: json['appVersion'] == null
          ? const AppVersionEntity()
          : AppVersionEntity.fromJson(
              json['appVersion'] as Map<String, dynamic>,
            ),
      currentVersion: json['currentVersion'] as String? ?? '',
      lastestVersion: json['lastestVersion'] as String? ?? '',
      storeUrl: json['storeUrl'] as String? ?? '',
      needUpdate: json['needUpdate'] as bool? ?? false,
    );

Map<String, dynamic> _$CheckVersionEntityToJson(_CheckVersionEntity instance) =>
    <String, dynamic>{
      'appVersion': instance.appVersion,
      'currentVersion': instance.currentVersion,
      'lastestVersion': instance.lastestVersion,
      'storeUrl': instance.storeUrl,
      'needUpdate': instance.needUpdate,
    };
