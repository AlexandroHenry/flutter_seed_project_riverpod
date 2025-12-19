// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VersionEntity _$VersionEntityFromJson(Map<String, dynamic> json) =>
    _VersionEntity(
      appVersion: json['appVersion'] == null
          ? const AppVersionEntity()
          : AppVersionEntity.fromJson(
              json['appVersion'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$VersionEntityToJson(_VersionEntity instance) =>
    <String, dynamic>{'appVersion': instance.appVersion};

_AppVersionEntity _$AppVersionEntityFromJson(Map<String, dynamic> json) =>
    _AppVersionEntity(
      androidVersion: json['androidVersion'] as String? ?? '',
      androidForceUpdate: json['androidForceUpdate'] as bool? ?? false,
      androidReason: json['androidReason'] as String? ?? '',
      iosVersion: json['iosVersion'] as String? ?? '',
      iosForceUpdate: json['iosForceUpdate'] as bool? ?? false,
      iosReason: json['iosReason'] as String? ?? '',
    );

Map<String, dynamic> _$AppVersionEntityToJson(_AppVersionEntity instance) =>
    <String, dynamic>{
      'androidVersion': instance.androidVersion,
      'androidForceUpdate': instance.androidForceUpdate,
      'androidReason': instance.androidReason,
      'iosVersion': instance.iosVersion,
      'iosForceUpdate': instance.iosForceUpdate,
      'iosReason': instance.iosReason,
    };
