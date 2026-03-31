import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import '../../core/infrastructure/database/app_database.dart';
import '../../core/infrastructure/database/daos/category_dao.dart';
import '../../core/infrastructure/database/daos/credential_dao.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage(
        aOptions: AndroidOptions(encryptedSharedPreferences: true),
      );

  @lazySingleton
  CredentialDao credentialDao(AppDatabase db) => db.credentialDao;

  @lazySingleton
  CategoryDao categoryDao(AppDatabase db) => db.categoryDao;
}
