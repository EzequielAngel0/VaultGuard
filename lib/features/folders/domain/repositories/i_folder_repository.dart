import '../entities/folder.dart';

abstract interface class IFolderRepository {
  Future<List<Folder>> getAll();
  Future<Folder?> getById(String id);
  Future<void> save(Folder folder);
  Future<void> delete(String id);
}
