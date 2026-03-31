import 'package:password_manager/features/credentials/domain/entities/category.dart';
import 'package:password_manager/features/credentials/domain/entities/credential.dart';

abstract interface class ICredentialRepository {
  Future<List<Credential>> getAll();
  Future<Credential?> getById(String id);
  Future<void> save(Credential credential);
  Future<void> update(Credential credential);
  Future<void> delete(String id);
  Future<List<Credential>> getByCategory(String categoryId);
  Future<List<Credential>> getFavorites();
  Future<List<Credential>> search(String query);
}

abstract interface class ICategoryRepository {
  Future<List<Category>> getAll();
  Future<Category?> getById(String id);
  Future<void> save(Category category);
  Future<void> delete(String id);
}
