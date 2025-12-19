import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:project_crew/core/shared/internal_storage.dart';
import 'package:project_crew/domain/entity/auth/account/account_entity.dart';

@LazySingleton(as: InternalStorage)
class InternalStorageImpl extends InternalStorage {
  InternalStorageImpl({required this.storage});

  final FlutterSecureStorage storage;

  final String accountInfo = 'accountInfo';

   @override
  Future<AccountEntity> getToken() async {
    try {
      final result = await storage.read(key: accountInfo);
      if (result != null) {
        return AccountEntity.fromJson(jsonDecode(result));
      } else {
        return const AccountEntity();
      }
    } catch (e) {
      debugPrint('$this: getToken() error');
      return const AccountEntity();
    }
  }

  @override
  Future<void> deleteToken() {
    return storage.delete(key: accountInfo);
  }

 

  @override
  Future<void> saveToken(String refreshToken, String accessToken) {
    return storage.write(
      key: accountInfo,
      value: jsonEncode(
        AccountEntity(
          refreshToken: refreshToken,
          accessToken: accessToken,
        ).toJson(),
      ),
    );
  }
}
