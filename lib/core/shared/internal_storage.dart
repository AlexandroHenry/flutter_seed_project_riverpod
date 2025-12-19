import 'package:project_crew/domain/entity/auth/account/account_entity.dart';

abstract class InternalStorage {

  // Account Management
  // Future<AccountEntity> getAccountInfo();
  // Future<void> saveAccountInfo(AccountEntity accountEntity);
  // Future<void> deleteAccountInfo();

  // Future<String> getTranslationFileId();
  // Future<void> saveTranslationFileId(String id);

  // Future<void> clearSearchKeyword();

  //////= ============================================= =====
  Future<AccountEntity> getToken();
  Future<void> saveToken(String refreshToken, String accessToken);
  Future<void> deleteToken();
}